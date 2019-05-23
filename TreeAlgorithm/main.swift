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
 589. N叉树的前序遍历
 https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/
 */

