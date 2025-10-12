//
//  Queue.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 04/10/25.
//

import Foundation
import Playgrounds

class QNode<T> {
    internal init(_ value: T, next: QNode<T>? = nil) {
        self.value = value
        self.next = next
    }
    
    var value: T
    var next: QNode?
}

class Queue<T> {
    
    var count: Int = 0 {
        didSet {
            if count == 0 {
                tail = nil
            }
        }
    }

    private var head: QNode<T>? = nil
    private var tail: QNode<T>? = nil {
        willSet {
            if head == nil {
                head = newValue
            }
        }
        didSet {
            if tail == nil {
                head = tail
            } else {
                count += 1
            }
        }
    }

    func enqueue(_ value: T) {
        let newNode = QNode(value)

        tail?.next = newNode
        tail = newNode
    }
    func deque() -> T? {
        guard head != nil else {
            return nil
        }

        let value = head?.value
        head = head?.next
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
            if node.next != nil {
                node = node.next!
            } else {
                flag = false
            }
        } while flag


        return listString
    }

}

#Playground {
    let queue = Queue<Int>()

    for i in 0...5 {
        queue.enqueue(i)
    }
    print(queue.peek()!)
    print(queue.count)
    _ = queue.deque()
    print(queue.count)
    print(queue.peek()!)
    print(queue.printList())


}
