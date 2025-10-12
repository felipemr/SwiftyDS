//
//  Quicksort.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 12/10/25.
//

import Foundation
import Playgrounds

func quicksort<T: Comparable>(_ input: Array<T>) -> Array<T> {
    var collection = input

    qs(&collection, lo: 0, hi: input.count - 1)

    return collection
}

fileprivate func qs<T: Comparable>(_ input: inout Array<T>, lo: Int, hi: Int)  {
    if lo >= hi {
        return
    }

    let pivotIndex = partition(&input, lo, hi)

    qs(&input, lo: 0, hi: hi - pivotIndex)
    qs(&input, lo: pivotIndex + 1, hi: hi)
}

// gets the pivot and put it in the right position
// returns the index of the pivot
fileprivate func partition<T: Comparable>(_ input: inout Array<T>, _ lo: Int, _ hi: Int) -> Int {
    input.swapAt(Int.random(in: lo...hi), hi)
    let pivotValue = input[hi]

    var pvtIndx = lo - 1

    for index in lo...hi {
        if input[index] <= pivotValue {
            pvtIndx += 1
            input.swapAt(pvtIndx, index)
        }
    }

    return pvtIndx
}

#Playground {
    let sorted = [1,2,3,4,5,6,7,8,9,10]
    let shuffled = sorted.shuffled()

    print(quicksort(shuffled) == sorted)
}
