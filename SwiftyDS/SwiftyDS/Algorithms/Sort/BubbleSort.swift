//
//  BubbleSort.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 02/10/25.
//

import Foundation
import Playgrounds

func bubbleSort<T: Comparable>(_ input: Array<T>) -> Array<T> {
    var collection = input
    var sorted = 0

    while collection.count - sorted > 1 {
        var index = 0

        while index + 1 < collection.count - sorted {
            if collection[index] > collection[index+1] {
                collection.swapAt(index, index + 1)

            }
            index += 1
        }

        sorted += 1
    }

    return collection
}

#Playground {
    let sorted = [1,2,3,4,5,6,7,8,9,10]
    let shuffled = sorted.shuffled()

    print(bubbleSort(shuffled) == sorted)
}
