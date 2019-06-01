//
//  main.swift
//  LeetCode
//
//  Created by wymany on 2019/5/17.
//  Copyright © 2019 wymany. All rights reserved.
//
import  Foundation

public class ListNode {
    var val:Int
    var next:ListNode?
    init(_ val:Int) {
        self.val = val
    }
}
func constructLink(_ nums:[Int]) -> ListNode? {
    if nums.isEmpty {
        return nil
    }
    var pre:ListNode? = nil
    var h:ListNode? = nil
    for i in nums {
        let node = ListNode(i)
        if h == nil {
            h = node
            pre = h
        } else {
            pre?.next = node
        }
    }
    return h
}



func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil || head?.next == nil {
        return head
    }
    var cur:ListNode? = head
    var pre:ListNode? = nil
    while cur != nil {
        if cur!.next == nil {
            return cur
        }
        let temp = cur!.next
        cur!.next = pre
        pre = cur!
        cur = temp
    }
    return nil
}


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    var cur1:ListNode? = l1
    var cur2:ListNode? = l2
    //新的有序的头结点
    let head = ListNode(0)
    var p = head

    while cur1 != nil && cur2 != nil {
        if cur1!.val < cur2!.val  {
            p.next = cur1
            cur1 = cur1!.next
        } else {
            p.next = cur2
            cur2 = cur2?.next
        }
        p = p.next!
    }
    if cur1 != nil {
        p.next = cur1
    }
    if cur2 != nil {
        p.next = cur2
    }
    return head.next
}


func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    if head == nil || head!.next == nil {
        return head
    }
    var pre = head
    var count = 1
    while pre?.next != nil {
        pre = pre?.next
        count += 1
    }
    //新的最末的结点
    let n  = count - k % count
    pre?.next = head
    var q = pre
    for _ in 0...n {
        q = q?.next
    }
    let ret = q?.next
    q?.next = nil
    return ret
}


func majorityElement(_ nums: [Int]) -> Int {
    return nums.sorted()[nums.count/2]
}

//let  n = majorityElement([2,8,7,12,9,10,11,9,9,9,4,5,9])
//print(n)

func sortList(_ head:ListNode?) -> ListNode? {
    if head == nil || head!.next == nil {
        return head
    }
    var pre:ListNode?
    var slow = head
    var fast  = head
    
    //拆成两个链表
    while fast != nil && fast?.next != nil {
        pre = slow
        slow = slow?.next
        fast = fast?.next?.next
    }
    pre?.next = nil
    
    let l1 = sortList(head)
    let l2 = sortList(slow)
    //step3 merget l1 ,l2
    return merge(l1,l2)
}

func merge(_ l1:ListNode?, _ l2:ListNode?) -> ListNode {
    var l = l1
    var r = l2
    
    let h = ListNode(0)
    var p = h
    while l != nil && r != nil {
        if l!.val < r!.val {
            p.next = l
            l  = l!.next
        } else {
            p.next = r!
            r = r!.next
        }
        p = p.next!
    }
    if l != nil {
        p.next = l
    }
    if r != nil {
        p.next = r
    }
    return h.next!
}

func subsets(_ nums:[Int]) -> [[Int]] {
    var res = [[Int]()]
    for i in nums {
        let size = res.count
        for j in 0..<size {
            var subSet = res[j].map{$0}
            subSet.append(i)
            res.append(subSet)
        }
    }
    return res
}

_ = subsets([10,12,8])


func permute(_ nums:[Int]) -> [[Int]] {
    if nums.isEmpty {
        return []
    }
    var list = [[Int]]()
    var temp = [Int]()
    backtrack(&list, nums: nums, tempList: &temp)
    return list
}
func backtrack(_ list:inout [[Int]], nums:[Int], tempList: inout [Int]) {
    if tempList.count == nums.count {
        list.append(tempList)
        return
    }
    for num in nums {
        if tempList.contains(num) {
            continue
        }
        tempList.append(num)

        backtrack(&list, nums: nums, tempList: &tempList)
        tempList.removeLast()
    }
}
func isPalindrome(_ s: String) -> Bool {
    if(s.isEmpty || s.count == 1){return true}
    
    var input = s
    let unsafeChars = CharacterSet.alphanumerics.inverted
    
    input = input.components(separatedBy: unsafeChars).joined(separator: "").lowercased()

    let inputArray = Array(input)
    var i = 0
    var j = inputArray.count - 1
    while (i < j) {
        if(inputArray[i] != inputArray[j]) {
            return false
        }
        i += 1
        j -= 1
    }
    return true
}


let c = isPalindrome("A man, a plan, a canal: Panama")
print(c)

class MinStack {
    var min = Int.max
    var stack = [Int]()
    
    func push(_ x:Int) {
        if x <= min {
            stack.append(min)
            min = x
        }
        stack.append(x)
    }
    
    func pop() {
        if stack.popLast() == min {
            min = stack.popLast() ?? 0
        }
    }
    func top() -> Int? {
        return stack.last
    }
    func getMin() -> Int {
        return min
    }
}

let stack = MinStack()
stack.push(-2)
stack.push(0)
stack.push(-3)
var min =  stack.getMin()
print(min)
stack.pop()
stack.pop()
min = stack.getMin()
print(min)


/*
 204. 计数质数
 https://leetcode-cn.com/problems/count-primes/
 统计所有小于非负整数 n 的质数的数量。
 */

func countPrimes(_ n:Int) -> Int {
    var notPrime = [Bool](repeating: false, count: n)
    var count = 0
    for i in 2..<n {
        if notPrime[i] == false {
            count += 1
            var j = 2
            while j * i < n {
                notPrime[i * j] = true
                j += 1
            }
        }
    }
    return count
}
/*
 263. 丑数
 https://leetcode-cn.com/problems/ugly-number/
 */
func isUgly(_ num:Int) -> Bool {
    if num <= 1 {
        return num == 1
    }
    var n = num
    while n%2 == 0 {
        n /= 2
    }
    while n % 3 == 0 {
        n /= 3
    }
    while n%5 == 0{
        n /= 5
    }
    return n == 1
}

/*
 *递归法实现丑数处理
 */
func isUglyR(_ num:Int) -> Bool {
    if num == 0 {
        return false
    }
    if num == 1 {
        return true
    }
    if num % 2 == 0 {
        return isUglyR(num / 2)
    }
    if num % 3 == 0 {
        return isUglyR(num / 3)
    }
    if num % 5 == 0 {
        return isUglyR(num / 5)
    }
    return false
}

/*
 118. 杨辉三角
 给定一个非负整数 numRows，生成杨辉三角的前 numRows 行。
 */
func generate(_ numRows:Int) -> [[Int]] {
    var triangle = [[Int]]()
    if numRows == 0 {
        return triangle
    }
    triangle.append([1])
    for rowNum in 1..<numRows {
        var row = [Int]()
        let preRow = triangle[rowNum - 1]
        row.append(1)
        for j in 1..<rowNum {
            row.append(preRow[j-1] + preRow[j])
        }
        row.append(1)
        triangle.append(row)
    }
    return triangle
}

/*
 119. 杨辉三角 II
https://leetcode-cn.com/problems/pascals-triangle-ii/
 */

func getRow(_ rowIndex: Int) -> [Int] {
    if rowIndex < 0 {
        return []
    }
//法2：根据组合数公式C(n,i)=n!/(i!*(n-i)!)直接由C(n,i)算C(n,i+1),后者是前者的(n-i)/(i+1)倍
    var ans = [Int](repeating:1, count: rowIndex + 1)
    for i in 0..<rowIndex {
        ans[i+1] = ans[i] * (rowIndex - i) / (i + 1)
    }
    return ans
}

let ans =  countPrimes(10)
print(ans)


