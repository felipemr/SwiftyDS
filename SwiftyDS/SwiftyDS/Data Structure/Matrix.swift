//
//  Matrix.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 16/10/25.
//

import Foundation
import Playgrounds

class Matrix {
    internal init(collection: [[String]]) {
        self.collection = collection
    }
    
    var collection: [[String]]

    func printo() {
        for item in collection {
            print(item)
        }
    }

}

#Playground {
    var matrix = [[String]] ()
    for row in 0...5 {
        var array = [String]()
        array.append("row: \(row)")
        for col in 0...5 {
            array.append("col: \(col)")
        }
        matrix.append(array)
    }

    let mat = Matrix(collection: matrix)
    mat.printo()
}
