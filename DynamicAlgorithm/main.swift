//
//  main.swift
//  DynamicAlgorithm
//
//  Created by wymany on 2019/5/23.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation
/*
 这里包含动态规划相关的题目
 */

/*
 509. 斐波那契数 https://leetcode-cn.com/problems/fibonacci-number/
 */

func fib(_ N:Int) -> Int {
    //这里 0<= N <= 30
    if N <= 1 {
        return N
    }
    var fib = [Int](repeating: 0, count: N + 1)
    fib[0] = 0
    fib[1] = 1
    for i in 2...N {
        fib[i] = fib[i - 1] + fib[i - 2]
    }
    return fib[N]
}

let fibN = fib(4)
print(fibN)






