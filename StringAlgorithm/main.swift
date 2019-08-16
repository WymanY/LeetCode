//
//  main.swift
//  StringAlgorithm
//
//  Created by wymany on 2019/6/1.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation
/*
 这里都是字符串相关的算法
 */

/*
 leetcode 409 最长回文串
 https://leetcode-cn.com/problems/longest-palindrome/
 */

func longestPalindrome(_ s:String) -> Int {
    let str = s.filter { (c) -> Bool in
        return ("A"..."Z").contains(c) || ("a"..."z").contains(c)
    }
    
    if str.count <= 1 {
        return str.count
    }
    var set = Set<Character>()
    var count = 0
    for c in str {
        if set.contains(c) {
            set.remove(c)
            count += 1
        } else {
            set.insert(c)
        }
    }
    if set.isEmpty {
        return 2 * count
    }
    return 2 * count + 1
}

/*
 680. 验证回文字符串 Ⅱ
 https://leetcode-cn.com/problems/valid-palindrome-ii/
 */

func validPalindrome(_ s:String) ->Bool {
    var l  = 0
    var r =  s.count - 1
    while l <= r {
        if (s[s.index(s.startIndex, offsetBy: l)] == s[s.index(s.startIndex, offsetBy: r)]) {
            l += 1
            r -= 1
        } else {
            return isPalindrome(s, l, r-1) || isPalindrome(s, l+1, r)
        }
    }
    return true
}

func isPalindrome(_ str:String, _ s:Int, _ t:Int) -> Bool {
    var s = s
    var t = t
    while s <= t {
        if str[str.index(str.startIndex, offsetBy: s)] == str[str.index(str.startIndex, offsetBy: t)] {
            s += 1
            t -= 1
        } else {
            return false
        }
    }
    return true
}

/*
 344. 反转字符串
 https://leetcode-cn.com/problems/reverse-string/
 */

func reverseString(_ s:inout [Character]) {
    //翻转字符
    var (i,j) = (0, s.count - 1)
    while i < j {
        s.swapAt(i, j)
        i += 1
        j -= 1
    }
}

/*
 541. 反转字符串 II
https://leetcode-cn.com/problems/reverse-string-ii/
 */

func reverseStr2(_ s:String, _ k:Int) -> String {
    var arr:[Character] = Array(s)
    let n  = arr.count
    var i = 0
    while i < n {//这一题算法不是特别懂，主要是题目没看懂
        let j = min(i + k - 1, n-1)
        arr.swapAt(i, j)
        i += 2 * k
    }
    return String(arr)
}

/*
 最长无重复子串，头条面试题碰到过
 */
/*
 第一种暴力法，存储所有的最长子序列
 */
func lenOflongestSubString(chs:[Character]) -> Int {
    guard !chs.isEmpty else {
        return 0
    }
    
    var longest:[Character] = [Character]()
    var curLongest = [Character]()
    var i = 0
    while  i < chs.count {
        var j = i
        while j < chs.count {
            if !longest.contains(chs[j]) {
                longest.append(chs[j])//=>abc
                j += 1
                if longest.count > curLongest.count {
                    curLongest = longest
                }
            } else {
                longest = [Character]()
            }
        }
        i += 1
    }
    print(curLongest)
    return curLongest.count
}

/*
 第二种操作滑动窗口法
 */
func lenOflongestSubString2(chs:[Character]) -> Int {
    guard !chs.isEmpty else {
        return 0
    }
    var set:Set<Character> = Set<Character>()
    
    var i = 0
    var j = 0
    var ans = 0
    while i < chs.count && j < chs.count {
        if set.contains(chs[j]) {
            set.remove(chs[i])
            i += 1
        } else {
            set.insert(chs[j])
            j += 1
            ans = max(ans, j - i)
        }
    }
    
 return ans
}
    



var str = "abcdgoabcfebd"
var len =  lenOflongestSubString2(chs: Array(str))
print(len)








