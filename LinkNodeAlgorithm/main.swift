//
//  main.swift
//  LinkNodeAlgorithm
//
//  Created by wymany on 2019/5/29.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func buildListLinkWith(_ arr:[Int]) -> ListNode? {
    if arr.isEmpty {
        return nil
    }
    
    var head:ListNode? = nil
    var cur:ListNode? = nil
    for v in arr {
        if head == nil {
            head = ListNode(v)
            cur = head
        } else {
            let node = ListNode(v)
            cur?.next = node
            cur = node
        }
    }
    return head
}

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

/*
 234. 回文链表
 https://leetcode-cn.com/problems/palindrome-linked-list/
 */

func isPalindrome(_ head: ListNode?) -> Bool {
    var fast = head
    var slow = head
    
    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next
    }
    if fast != nil { //奇数数目链表：让右边的链表小
        slow = slow?.next
    }
    slow = reverse(slow)
    fast = head
    while slow != nil {
        if fast?.val != slow?.val {
            return false
        }
        fast = fast?.next
        slow = slow?.next
    }
    return true
}

func reverse(_ head:ListNode?) -> ListNode? {
    var cur:ListNode? = head
    var pre:ListNode? = nil
    while cur != nil {
        let next = cur?.next
        cur!.next = pre
        pre = cur
        cur = next
    }
    return pre
}

let h = buildListLinkWith([1])

let ans = isPalindrome(h)
print(ans)






