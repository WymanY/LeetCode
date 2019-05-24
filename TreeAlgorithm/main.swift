//
//  main.swift
//  TreeAlgorithm
//
//  Created by wymany on 2019/5/23.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation


// N-ary Tree preOrder Traversal
public class Node {
    var val:Int
    var childern:[Node]?
    init(_ val:Int, _ children:[Node]? = nil) {
        self.val = val
        self.childern = children
    }
    
    //循环模式前序遍历
    /*
     589. N叉树的前序遍历
     https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
     */
    func preroder(_ root:Node?) -> [Int] {
        if root == nil {
            return []
        }
        var list = [Int]()
        var stack:[Node] = [Node]()
        stack.append(root!)
        while !stack.isEmpty {
            let root = stack.popLast()!
            list.append(root.val)
            guard let children = root.childern  else {
                return list
            }
            var i = children.count - 1
            while i >= 0 {
                stack.append(children[i])
                i = i - 1
            }
        }
        return list
    }
    /*
     590. N叉树的后序遍历
     https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/
     */
    func postOrder(_ root:Node?) -> [Int] {
        if root == nil {
            return []
        }
        var stack:[Node] = [Node]()
        var list = [Int]()
        stack.append(root!)
        while !stack.isEmpty {
            let root = stack.popLast()
            list.append(root!.val)
            
            guard let childern = root?.childern else{
                return list
            }
            for child in childern {
                stack.append(child)
            }
        }
        return list.reversed()
    }
}

// 添加二叉树的遍历问题
public class TreeNode {
    var val:Int
    var left:TreeNode?
    var right:TreeNode?
    
    init(_ val:Int, _ left:TreeNode? = nil, _ right:TreeNode? = nil) {
        self.val = val
        self.left = left
        self.right = right
    }
}

enum Tag {
    case left
    case right
}

struct TagNode {
    var node: TreeNode?
    var tag:Tag = .left
}

//后续遍历。使用辅助数据结构
func postOrder(_ root:TreeNode?) {
    guard let root = root else {
        return
    }
    //充当stack
    var s = [TagNode]()
    var p:TreeNode? = root
    var tagNode = TagNode()
    
    while !s.isEmpty || p != nil {
        while  p != nil {
            tagNode.node = p!
            tagNode.tag = .left
            s.append(tagNode)
            p = p?.left
        }
        tagNode = s.last!
        _ = s.popLast()
        
        if tagNode.tag == .left {
            tagNode.tag = .right
            s.append(tagNode)
            p = tagNode.node
            p = p?.right
        } else {
            print("--> \(tagNode.node?.val ?? -1) ---")
        }
    }
}


func postOrderR(_ root:TreeNode?) { //后续遍历的递归写法，带R说明是递归写法，
    if root == nil {
        return
    }
    postOrder(root?.left)
    postOrder(root?.right)
    print("root.val =  \(root?.val ?? -1)")
}

func midOrderR(_ root:TreeNode?) {
    if root == nil {
        return
    }
    midOrderR(root?.left)
    print("root.val =  \(root?.val ?? -1)")
    midOrderR(root?.right)
}

func preOrderR(_ root:TreeNode?) {
    if  root == nil {
        return
    }
    print("root.val =  \(root?.val ?? -1)")
    preOrderR(root?.left)
    preOrderR(root?.right)
    }

func levelOrder(_ root:TreeNode?) {
    if root == nil {
        return
    }
    
    var queue = [TreeNode]()
    queue.append(root!)
    while !queue.isEmpty {
        let node =  queue.removeFirst()
        print("---->node = \(node.val)")
        if let left = node.left {
            queue.append(left)
        }
        if let right = node.right {
            queue.append(right)
        }
    }
}



var f = TreeNode(6)
var g = TreeNode(4)

var h = TreeNode(8, f, g)
var i = TreeNode(7)
var A  = TreeNode(5, h, i)

//midOrderR(A)
levelOrder(A)


