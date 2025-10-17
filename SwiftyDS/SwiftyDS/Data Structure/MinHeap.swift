//
//  MinHeap.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 13/10/25.
//

import Foundation
import Playgrounds


class MinHeap {
    var collection = [Int]()
    var count: Int {
        collection.count
    }

    func getLeftNode(_ idx: Int) -> Int {
        (2 * idx) + 1
    }
    func getRightNode(_ idx: Int) -> Int {
        (2 * idx) + 2
    }
    func getParent(_ idx: Int) -> Int {
        Int((idx - 1) / 2)
    }

    func insert(value: Int) {
        self.collection.append(value)
        heapifyUp(idx: collection.count - 1)
    }

    func remove() -> Int? {
        let currentMin = collection.first

        collection.swapAt(0, collection.count - 1)
        collection.removeLast()

        if count > 0 {
            heapifyDown(idx: 0)
        }

        return currentMin
    }

    private func heapifyDown(idx: Int) {
        let leftIdx = self.getLeftNode(idx)
        let rightIdx = self.getRightNode(idx)
        let currentValue = collection[idx]
        
        guard idx < self.count && leftIdx < self.count else {
            return
        }

        let leftValue = collection[leftIdx]

        if rightIdx >= self.count {
            if leftValue <= currentValue {
                collection.swapAt(idx, leftIdx)
                heapifyDown(idx: leftIdx)
            }
            return
        }

        let rightValue = collection[rightIdx]
        if leftValue < rightValue {
            if leftValue <= currentValue {
                collection.swapAt(idx, leftIdx)
                heapifyDown(idx: leftIdx)
            }
        } else {
            if rightValue <= currentValue {
                collection.swapAt(idx, rightIdx)
                heapifyDown(idx: rightIdx)
            }
        }
        
    }
    private func heapifyUp(idx: Int) {
        guard idx != 0 else {
            return
        }

        let parentIdx = self.getParent(idx)

        if collection[parentIdx] > collection[idx] {
            collection.swapAt(idx, parentIdx)
            self.heapifyUp(idx: parentIdx)
        }
    }

}

#Playground {
    var heap = MinHeap()

    for num in 0...10 {
        heap.insert(value: Int.random(in: 0...100))
    }

    print(heap.collection)

    for num in 0...10 {
        print("Removed", heap.remove()!)
        print(heap.collection)
    }
}
