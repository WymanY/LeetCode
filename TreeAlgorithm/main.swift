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
    /*1
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

/*
 添加二叉树的遍历问题
*/
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

/*
 94. 二叉树的中序遍历
 https://leetcode-cn.com/problems/binary-tree-inorder-traversal/
 */
func inorderTraversal(_ root:TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    var list = [Int]()
    var stack = [root!]
    var cur:TreeNode? = root!.left
    while cur != nil || !stack.isEmpty {
        while cur != nil {
            stack.append(cur!)
            cur = cur!.left
        }
        cur = stack.popLast()
        list.append(cur!.val)
        cur = cur!.right
    }
    
    return list
}

/*
 144. 二叉树的前序遍历
 https://leetcode-cn.com/problems/binary-tree-preorder-traversal/
*/
func preorderTraversal(_ root:TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    var stack = [TreeNode]()
    var list = [Int]()
    var cur = root
    while cur != nil || !stack.isEmpty  {
        while cur != nil {
            stack.append(cur!)
            list.append(cur!.val)
            cur = cur!.left
        }
        cur = stack.popLast()
        cur = cur?.right
    }
    return list
}

/*
 102. 二叉树的层次遍历
https://leetcode-cn.com/problems/binary-tree-level-order-traversal/submissions/
 */
func levelOrder(_ root:TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var queue = [TreeNode]()
    var list = [[Int]]()
    queue.append(root!)
    while !queue.isEmpty{
        let levelNum = queue.count
        var subList = [Int]()
        for _ in 0..<levelNum {
            if let left = queue.first!.left {
                queue.append(left)
            }
            if let right = queue.first!.right {
                queue.append(right)
            }
            subList.append(queue.removeFirst().val)
        }
        list.append(subList)
    }
    return list
}

/*
 637. 二叉树的层平均值
 https://leetcode-cn.com/problems/average-of-levels-in-binary-tree/
 */

func averageOfLevels(_ root:TreeNode?) -> [Double] {
    if root == nil {
        return []
    }
    var result = [Double]()
    var queue = [TreeNode]()
    queue.append(root!)
    while !queue.isEmpty {
        let levelN = queue.count
        var sum = 0
        for _ in 0..<levelN {
            if let left = queue.first!.left {
                queue.append(left)
            }
            if let right = queue.first!.right {
                queue.append(right)
            }
            let node = queue.removeFirst()
            sum += node.val
        }
        result.append((Double)(sum) / Double(levelN))
    }
    return result
}

/*
 107. 二叉树的层次遍历 II
 https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/
 */
func levelOrderBottom(_ root:TreeNode?) -> [[Int]] {
    if root == nil {
        return []
    }
    var queue = [TreeNode]()
    var list = [[Int]]()
    queue.append(root!)
    while !queue.isEmpty{
        let levelNum = queue.count
        var subList = [Int]()
        for _ in 0..<levelNum {
            if let left = queue.first!.left {
                queue.append(left)
            }
            if let right = queue.first!.right {
                queue.append(right)
            }
            subList.append(queue.removeFirst().val)
        }
        list.insert(subList, at: 0)
    }
    return list
}

/*
 二叉树的最近公共祖先
 https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-tree/
 */

func lowestCommonAncestor(_ root:TreeNode?, _ p:TreeNode?, _ q:TreeNode?) -> TreeNode? {
    if root == nil || p == root || q == root  {
        return root
    }
    
    let left = lowestCommonAncestor(root?.left, p, q)
    let right = lowestCommonAncestor(root?.right, p, q)
    return left == nil ? right : right == nil ? left : root
}






var f = TreeNode(6)
var g = TreeNode(4)
var h = TreeNode(8, f, g)
var i = TreeNode(7)
var A  = TreeNode(5, h, i)

//midOrderR(A)
//levelOrder(A)
let c =  preorderTraversal(A)
print(c)


