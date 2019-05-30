//
//  main.swift
//  LinkNodeAlgorithm
//
//  Created by wymany on 2019/5/29.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation

/*
 代码参考这一l篇文章https://www.jianshu.com/p/fb5a4169a618
 */
public class DoublyNode {
    var val:Int
    var next:DoublyNode?
    var pre:DoublyNode?
    
    init(_ val:Int, _ pre:DoublyNode? = nil, _ next: DoublyNode? = nil) {
        self.val = val
        self.pre = pre
        self.next = next
    }
}


/*双链表*/
public class DoublyLinkedList {
    var length = 0
    var head:DoublyNode? = nil
    var tail:DoublyNode? = nil
    
    func append(_ element:Int) {
        let node = DoublyNode(element)
        if self.head == nil {
            self.head = node
            self.tail = node
        } else {
            self.tail?.next = node
            node.pre = self.tail
            self.tail = node
        }
        self.length += 1
    }
}
