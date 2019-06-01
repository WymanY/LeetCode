//
//  main.swift
//  ArrayAlgorithm
//
//  Created by wymany on 2019/5/30.
//  Copyright © 2019 wymany. All rights reserved.
//

import Foundation
/*
 这里是数组相关的leetcode的题目，
 */

/*
349. 两个数组的交集
 https://leetcode-cn.com/problems/intersection-of-two-arrays/
 */
func intersection(_ nums1:[Int], _ nums2:[Int]) -> [Int] {
    let set1 = Set(nums1)
    let set2 = Set(nums2)
    let intersect = set1.intersection(set2)
    return Array(intersect)
}

func intersection1(_ nums1:[Int], _ nums2:[Int]) -> [Int] {
    let a1 =  nums1.sorted()
    let a2 = nums2.sorted()
    var ans = Set<Int>()
    var (i,j) = (0,0)
    while i < a1.count && j < a2.count {
        if a1[i] < a2[j] {
            i += 1
        } else if a1[i] > a2[j] {
            j += 1
        } else {
            ans.insert(a1[i])
            i += 1
            j += 1
        }
    }
    return Array(ans)
}

/*
 二维数组的查找，剑指offer 第三题
 */

func findTargetIn(_ target:Int, in arry:[[Int]]) -> Bool {
    let row = arry.count
    let col = (arry.first?.count ?? 0)
    
    //直接从右上角进行查找
    var (i,j) = (0,col - 1)
    while i >= 0 && i < row && j >= 0 && j < col  {
        if target == arry[i][j] {
            return true
        } else if target < arry[i][j]{
            j -= 1
        } else {
            i += 1
        }
    }
    return false
}

let res =  findTargetIn(3, in: [[1,2,8,9],[2,4,9,12],[4,7,10,13],[6,8,11,15]])
print(res)


let num1 = [10,8,9]
let num2 = [12,0,9]
let c = intersection1(num1, num2)
print(c)


