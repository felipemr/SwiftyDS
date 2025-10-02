//
//  JumpSearch.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 01/10/25.
//

import Foundation
import Playgrounds

func jumpSearch<T: Comparable>(_ missing: T, at collection: Array<T>) -> Bool {
    // define our jumpAmount
    let jumpAmount = Int(Double(collection.count).squareRoot())
    var index = 0
    while index < collection.count {
        // Check if we got lucky
        if collection[index] == missing {
            return true
        }
        // Check if passed
        if collection[index] > missing {
            return linearSearch(missing, at: collection[index-jumpAmount...index])
        }

        index += jumpAmount
    }
    index -= jumpAmount
    return linearSearch(missing, at: collection[index...])
}

func linearSearch<T: Equatable>(_ missing: T, at collection: ArraySlice<T>) -> Bool {
    for item in collection {
        if item == missing {
            return true
        }
    }
    return false
}

#Playground {
    let collection = [1,2,3,4,5,6,7,8,10]

    print("worked to find 5:",jumpSearch(5, at: collection))
    print("worked to find 1:",jumpSearch(1, at: collection))
    print("worked to find 10:",jumpSearch(10, at: collection))
    print("worked to find 9:",jumpSearch(9, at: collection))
}
