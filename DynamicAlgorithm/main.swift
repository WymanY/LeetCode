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
/*
 70. 爬楼梯
 https://leetcode-cn.com/problems/climbing-stairs/
 */
func climbStairs(_ n:Int) -> Int {
    var dp = [Int](repeatElement(1, count: n+1))
    dp[1] = 1
    dp[2] = 2
    for i in 3...n {
        dp[i] = dp[i-1] + dp[i-2]
    }
    return dp[n]
}

let y =  climbStairs(3)

/*
 264. 丑数 II
 https://leetcode-cn.com/problems/ugly-number-ii/solution/js-duo-zhi-zhen-ji-bai-liao-9859-de-yong-hu-by-lin/
 */

func nthUglyNumber(_ n:Int) -> Int {
    if n <= 1 {
        return n
    }
    var dp = [Int](repeating: 1, count: n)
    var (t2,t3,t5) = (0,0,0)
    
    for i in 1..<n {
        dp[i] = min(dp[t2] * 2, dp[t3] * 3, dp[t5] * 5)
        if dp[i] == dp[t2] * 2 {
            t2 += 1
        }
        if dp[i] == dp[t3] * 3 {
            t3 += 1
        }
        if dp[i] == dp[t5] * 5 {
            t5 += 1
        }
    }
    return dp[n-1]
}

let c = nthUglyNumber(10)
print(c)








