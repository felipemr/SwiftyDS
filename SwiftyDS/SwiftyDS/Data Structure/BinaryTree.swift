//
//  BinaryTree.swift
//  SwiftyDS
//
//  Created by Felipe Marques Ramos on 13/10/25.
//

import Foundation
import Playgrounds

enum BinaryTreeTraversal {
    case preorder
    case inorder
    case postorder
    case byLevel // BFS
}

class BinaryTreeNode {
    internal init(_ value: Int, left: BinaryTreeNode? = nil, right: BinaryTreeNode? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    var value: Int
    weak var parent: BinaryTreeNode?
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?

    func toArray(_ traversal: BinaryTreeTraversal) -> [Int] {
        var converted = [Int]()
        switch traversal {
        case .preorder:
            preorderTraversal {
                converted.append($0)
            }
        case .inorder:
            inorderTraversal {
                converted.append($0)
            }
        case .postorder:
            postorderTraversal {
                converted.append($0)
            }
        case .byLevel:
            bfs {
                converted.append($0)
            }
        }
        return converted
    }

    func preorderTraversal(_ visitNode: (Int) -> Void ) {
        visitNode(self.value)
        left?.preorderTraversal(visitNode)
        right?.preorderTraversal(visitNode)
    }

    func inorderTraversal(_ visitNode: (Int) -> Void )  {
        left?.preorderTraversal(visitNode)
        visitNode(self.value)
        right?.preorderTraversal(visitNode)
    }

    func postorderTraversal(_ visitNode: (Int) -> Void )  {
        left?.preorderTraversal(visitNode)
        right?.preorderTraversal(visitNode)
        visitNode(self.value)
    }


    func bfs(_ visitNode: (Int) -> Void ) {
        // we should use a true queue here to avoid On mutations of the first item
        var queue = [BinaryTreeNode]()
        queue.append(self)

        while queue.count > 0 {
            let node = queue.removeFirst()
            if node.left != nil {
                queue.append(node.left!)
            }
            if node.right != nil {
                queue.append(node.right!)
            }
            visitNode(node.value)
        }
    }

    func isEqual(_ other: BinaryTreeNode?) -> Bool {
        guard let other else {
//            print("false 1")
            return false
        }
//        print("checking", self.value, other.value)
        guard let left else {
//            print("false 2")
            return other.left == nil
        }
        guard let right else {
//            print("false 3")
            return other.right == nil
        }

        return self.value == other.value && left.isEqual(other.left) && right.isEqual(other.right)
    }
}

#Playground {
    var a1 = BinaryTreeNode(0)
    var b1 = BinaryTreeNode(1)
    var c1 = BinaryTreeNode(2)
    var d1 = BinaryTreeNode(3)
    var e1 = BinaryTreeNode(4)
    var f1 = BinaryTreeNode(5)
    var g1 = BinaryTreeNode(6)

    a1.left = b1
    a1.right = c1

    b1.left = d1
    b1.right = e1

    c1.left = f1
    c1.right = g1

    var a2 = BinaryTreeNode(0)
    var b2 = BinaryTreeNode(1)
    var c2 = BinaryTreeNode(2)
    var d2 = BinaryTreeNode(3)
    var e2 = BinaryTreeNode(4)
    var f2 = BinaryTreeNode(5)
    var g2 = BinaryTreeNode(6)

    a2.left = b2
    a2.right = c2

    b2.left = d2
    b2.right = e2

    c2.left = f2
    c2.right = g2

    var a3 = BinaryTreeNode(0)
    var b3 = BinaryTreeNode(1)
    var c3 = BinaryTreeNode(2)
    var d3 = BinaryTreeNode(3)
    var e3 = BinaryTreeNode(4)
    var f3 = BinaryTreeNode(5)

    a3.left = b3
    a3.right = c3

    b3.left = d3
    b3.right = e3

    c3.left = f3

//    print("PRE-order", a.toArray(.preorder))
//    print("In-order", a.toArray(.inorder))
//    print("Post-order", a.toArray(.postorder))
//    print("BFS", a.toArray(.byLevel))

    print(a1.isEqual(a2))
    print(a1.isEqual(a3))
}


