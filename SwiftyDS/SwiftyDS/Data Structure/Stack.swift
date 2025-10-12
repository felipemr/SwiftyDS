//
//  Stack.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 05/10/25.
//

import Foundation
import Playgrounds

class SNode<T> {
    internal init(_ value: T, previous: SNode<T>? = nil) {
        self.value = value
        self.previous = previous
    }

    var value: T
    var previous: SNode?
}

class Stack<T> {

    var count: Int = 0

    private var head: SNode<T>? = nil

    func push(_ value: T) {
        let newNode = SNode(value)

        newNode.previous = head
        head = newNode

        count += 1
    }

    func pop() -> T? {
        guard head != nil else {
            return nil
        }

        let value = head?.value
        head = head?.previous
        count -= 1

        return value
    }

    func peek() -> T? {
        return head?.value
    }

    func printList() -> String {
        guard let head else {return ""}
        var listString = ""

        var node = head
        var flag = true

        repeat {
            listString += "[\(node.value)] -> "
            if node.previous != nil {
                node = node.previous!
            } else {
                flag = false
            }
        } while flag

        listString += "end"


        return listString
    }

}

#Playground {
    let stack = Stack<Int>()

    for i in 0...5 {
        stack.push(i)
    }
    print(stack.peek()!)
    print(stack.count)
    _ = stack.pop()
    print(stack.count)
    print(stack.peek()!)
    print(stack.printList())


}
