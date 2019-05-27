//
//  main.swift
//  SortAlgorithm
//
//  Created by wymany on 2019/5/24.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation

/*
 这里包含了十大排序算法的swift解法
 */

/*
 1。冒泡排序,每次把最大的一个元素移动到最上边n
 */
func bubbleSort(_ a:[Int]) -> [Int] {
    if a.count <= 1 {
        return a
    }
    var arr = a
    let n = a.count
    for i in 0..<n {
        for j in 0..<n-1-i {
            if arr[j] > arr[j+1] {
                arr.swapAt(j, j+1)
            }
        }
    }
    return arr
}

var a = [10,8,9,5,3,12]
let b = bubbleSort(a)
print(b)



