//
//  LinkedList.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 04/10/25.
//

import Foundation
import Playgrounds

class LinkedList {
    var head: LinkedListNode
    var tail: LinkedListNode

    internal init(head: LinkedListNode) {
        self.head = head
        self.tail = head
    }

    func append(_ node: LinkedListNode) {
        tail.next = node
        tail = node
    }

    func append(_ value: Int) {
        var node = LinkedListNode(value: value)
        tail.next = node
        tail = node
    }

    func prepend(_ node: LinkedListNode) {
        node.next = head
        head = node
    }

    func insertAt(_ pos: Int, value: Int) {
        guard pos != 0 else {return}

        var index = 1
        var previous = head
        var current = head.next!

        while index < pos && current.next != nil {
            previous = current
            current = current.next!
            index += 1
        }

        var node = LinkedListNode(value: value)
        previous.next = node
        node.next = current
    }

    func printList() -> String {
        var listString = ""

        var node = head
        var flag = true

        repeat {
            listString += "[\(node.value)] -> "
            if node.next != nil {
                node = node.next!
            } else {
                flag = false
            }
        } while flag


        return listString
    }


}

class LinkedListNode {
    internal init(value: Int, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }
    
    var value: Int
    var next: LinkedListNode?
}

#Playground {
    var head = LinkedListNode(value: 0)
    var list = LinkedList(head: head)

    for i in 1...5 {
        list.append(i)
    }


    print(list.printList())

    list.prepend(LinkedListNode(value: -1))
    print(list.printList())

    list.insertAt(4, value: 99)
    print(list.printList())
}
