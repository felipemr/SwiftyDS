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
        let node = LinkedListNode(value)
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

        let node = LinkedListNode(value)
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
    var value: Int
    var next: LinkedListNode?

    public init() { self.value = 0; self.next = nil; }
    public init(_ val: Int) { self.value = val; self.next = nil; }
    public init(_ val: Int, _ next: LinkedListNode?) { self.value = val; self.next = next; }
}

// Common List issues
extension LinkedListNode {
    // Easy
    // Reverse Linked List
    // Given the head of a singly linked list, reverse the list, and return the reversed list.
    // [1,2,3,4,5] -> [5,4,3,2,1]
    // [1,2] -> [2,1]
    // [2] -> [2]
    // [] -> []
    static func reverseList(_ head: LinkedListNode?) -> LinkedListNode? {
        var stack = [Int]()

        var node = head
        while node?.next != nil {
            stack.append(node!.value)
            node = node?.next
        }
//        print(stack)

        let newHead = node
        while !stack.isEmpty {
            node?.next = LinkedListNode(stack.removeLast())
            node = node?.next
        }

        return newHead
    }
    static func reverseList2(_ head: LinkedListNode?) -> LinkedListNode? {
        print("current head")
        if head?.next == nil {
            print("returned head")
            return head
        }

        let previousNext = reverseList2(head?.next)
        print("received \(previousNext?.value ?? 0)")
        previousNext?.next = head
        print("previous new next \(head?.value ?? 0)")
        return previousNext?.next
    }



    //Merge Two Sorted Lists
    // Linked List Cycle

    //Medium
    // Reorder List
    // Remove Nth Node From End of List
    // Copy List With Random Pointer
    // Add Two Numbers
    // Find The Duplicate Number
    // LRU Cache

    // Hard
    // Merge K Sorted Lists
    // Reverse Nodes In K Group

}


extension LinkedListNode {
    convenience init(count n: Int,_ starting: Int = 0) {
        self.init(starting)
        var next = self

        for i in (starting + 1)...n {
            let tmp = LinkedListNode(i)
            next.next = tmp
            next = tmp as! Self
        }

    }

    convenience init(_ array: [Int]) {
        self.init(array[0])
        var next = self

        for i in 1..<array.count {
            let tmp = LinkedListNode(array[i])
            next.next = tmp
            next = tmp as! Self
        }
    }

    func traverse(process: (LinkedListNode?) -> Void ) {
        var current: LinkedListNode? = self
        while current != nil {
            process(current)
            current = current?.next
        }
    }
    static func recurse(_ head: LinkedListNode?, process: (LinkedListNode?) -> Void ) {
        guard head != nil else {
            return
        }
        process(head)
        recurse(head?.next, process: process)
    }

    func recurse(process: (LinkedListNode?) -> Void ) {
        process(self)
        self.next?.recurse(process: process)
    }

    func prettyPrint() -> String {
        var current: LinkedListNode? = self
        var prettyString = ""
        while current != nil {
            prettyString += "["
            if let value = current?.value {
                prettyString += "\(value)"
            } else {
                prettyString += "NULL"
            }
            prettyString += "] -> "
            current = current?.next
        }

        prettyString += "END"

        return prettyString
    }

    static func values(_ head: LinkedListNode?) -> [Int] {
        guard head != nil else {
            return []
        }
        var vals = [head!.value]
        vals.append(contentsOf: LinkedListNode.values(head?.next))

        return vals
    }

    func values() -> [Int] {
        var vals = [self.value]
        Self.valuesR(node: self.next, values: &vals)
        return vals
    }

    static func valuesR(node: LinkedListNode?, values: inout [Int]) {
        guard let node else { return }

        values.append(node.value)
        Self.valuesR(node: node.next, values: &values)
    }

    func sum() -> Int {
        return self.value + (self.next?.sum() ?? 0)
    }

    static func sum(head: LinkedListNode?) -> Int {
        var current = head
        var sum = 0

        while current != nil {
            sum += current!.value
            current = current?.next
        }

        return sum
    }

    func find(_ needle: Int) -> Bool {
        var current: LinkedListNode? = self as! Self
        while current != nil {
            if current!.value == needle {
                return true
            }
            current = current!.next
        }
        return false
    }

    func findR(_ needle: Int) -> Bool {
        self.value == needle ? true : self.next?.findR(needle) ?? false
    }

    func get(at index: Int) -> LinkedListNode? {
        var current: LinkedListNode? = self
        var index = index
        while index > 0 && current != nil {
            current = current!.next
            index -= 1
        }
        return current
    }

    func getR(at index: Int) -> LinkedListNode? {
        return index == 0 ? self : self.next?.getR(at: index - 1) ?? nil
    }

    func reverse() -> LinkedListNode? {
        var previous: LinkedListNode? = nil
        var current: LinkedListNode? = self

        while current != nil {
            let next: LinkedListNode? = current?.next
            current?.next = previous

            previous = current
            current = next
        }

        return previous
    }

    // [1,2,3,4,5] ==> [1] -> [2] -> [3] -> [4] -> [5] -> NIL
    static func reverse(_ head: LinkedListNode?) -> LinkedListNode? {
        guard head?.next != nil else { return head }

        let previous = LinkedListNode.reverse(head?.next)
        
        head?.next?.next = head
        head?.next = nil

        return previous
    }

    static func zip(_ head1: LinkedListNode?, _ head2: LinkedListNode?) -> LinkedListNode? {
        guard head2 != nil else {return head1}
        guard head1 != nil else {return head2}

        var list1 = head1
        var list2 = head2

        var rest = list1?.next
        while list1 != nil && list2 != nil {
            rest = list1?.next
            list1?.next = list2
            list2 = rest
            list1 = list1?.next
        }

        if list1 == nil {
            rest?.next = list2
        }

        if list2 == nil {
            rest?.next = list1
        }


        return head1
    }

    static func zipR(_ head1: LinkedListNode?, _ head2: LinkedListNode?) -> LinkedListNode? {
        guard head2 != nil else {return head1}
        guard head1 != nil else {return head2}

        let rest1 = head1?.next

        head1?.next = LinkedListNode.zipR(head2, rest1)

        return head1
    }

}


#Playground {
//    let a = LinkedListNode(count: 10)
//    let b = LinkedListNode([1,2,3,4,5,6,7,8,9])
//    let c = LinkedListNode([2,8,3,7])

    let m1 = LinkedListNode([1,3,5,7])
    let m2 = LinkedListNode([2,4,6,8,10])

//    print(a.prettyPrint())
//    print(b.prettyPrint())

//    print(LinkedListNode.values(a))
//    print(b.values())
//
//    print(c.sum())
//    print(LinkedListNode.sum(head: b))
//
//    print(a.find(99))
//    print(a.find(1))
//    print(a.findR(99))
//    print(a.findR(1))
//
//    print(b.get(at: 3)!.value)
//    print(b.getR(at: 3)!.value)

//    print(a.prettyPrint())
//    print(a.reverse()!.prettyPrint())
////    print(LinkedListNode.reverse(a)!.prettyPrint())
//    print(b.prettyPrint())
//    print(b.reverse()!.prettyPrint())
////    print(LinkedListNode.reverse(b)!.prettyPrint())
//    print(c.prettyPrint())
//    print(c.reverse()!.prettyPrint())
//    print(LinkedListNode.reverse(c)!.prettyPrint())

//    print(LinkedListNode.zip(m1,m2)!.prettyPrint())
    print(LinkedListNode.zipR(m1,m2)!.prettyPrint())
}
