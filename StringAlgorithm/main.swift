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

let b =  validPalindrome("tebbem")





