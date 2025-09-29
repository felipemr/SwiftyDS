//
//  LinearSearch.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 29/09/25.
//

import Foundation
import Playgrounds

enum LoopStrategy: CaseIterable {
    case standardForIn
    case rangedForIn
    case stride
    case whileLoop
    case repeatWhile
}

func linearSearch<T: Equatable>(_ missing: T, at collection: Array<T>, strategy: LoopStrategy = .standardForIn) -> Bool {

    switch strategy {
    case .standardForIn:
        for item in collection {
            if item == missing {
                return true
            }
        }
    case .rangedForIn:
        for index in 0...collection.count-1 {
            if collection[index] == missing {
                return true
            }
        }
    case .stride:
        let interval = 1
        for index in stride(from: 0, to: collection.count, by: interval){
            if collection[index] == missing {
                return true
            }
        }
    case .whileLoop:
        var index = 0
        while index < collection.count {
            if collection[index] == missing {
                return true
            }
            index += 1
        }
    case .repeatWhile:
        var index = 0
        repeat {
            if collection[index] == missing {
                return true
            }
            index += 1
        } while index < collection.count
    }
    return false
}


#Playground {
    let collection = [1,2,3,4,5,6,7,8,10]

    for strategy in LoopStrategy.allCases {
        print("\(strategy) worked to find 1:",linearSearch(1, at: collection, strategy: strategy))
        print("\(strategy) worked to find 10:",linearSearch(10, at: collection, strategy: strategy))
        print("\(strategy) worked to find 9:",linearSearch(9, at: collection, strategy: strategy))
    }
}
