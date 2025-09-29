//
//  BinarySearch.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 29/09/25.
//

import Foundation
import Playgrounds


func binarySearch<T: Comparable>(_ missing: T, at collection: Array<T>) -> Bool {
    var hi = collection.count
    var lo = 0

    while lo<hi {

        let mid = lo/2 + hi/2
        let midValue = collection[mid]

        if midValue == missing {
            return true
        }

        if missing > midValue {
            lo = mid+1
        } else {
            hi = mid
        }
    }

    return false
}

func binarySearchRecursive<T: Comparable>(_ missing: T, at collection: Array<T>) -> Bool {
    return binarySearchRecursiveAux(missing, at: collection, lo: 0, hi: collection.count)
}

func binarySearchRecursiveAux<T: Comparable>(_ missing: T, at collection: Array<T>, lo: Int, hi: Int) -> Bool {

    let mid = lo/2 + hi/2
    let value = collection[mid]

    if lo >= hi {
        return false
    }

    // We found it!
    if value == missing {
        return true
    } else if missing > value {
        return binarySearchRecursiveAux(missing, at: collection, lo: mid+1, hi: hi)
    } else {
        return binarySearchRecursiveAux(missing, at: collection, lo: lo, hi: mid)
    }
}

#Playground {
    let collection = [1,2,3,4,5,6,7,8,10]

    print("worked to find 5:",binarySearchRecursive(5, at: collection))
    print("worked to find 1:",binarySearchRecursive(1, at: collection))
    print("worked to find 10:",binarySearchRecursive(10, at: collection))
    print("worked to find 9:",binarySearchRecursive(9, at: collection))
}
