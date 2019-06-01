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

let n = longestPalindrome("1")
print(n)




