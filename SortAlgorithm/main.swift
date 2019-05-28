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
 整个算法的实现参考这一篇文章
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

/*
 每次选择最小的放在已排序的最后面
 */
func selectionSort(_ arr:[Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    var a =  arr
    let n = arr.count
    
    for i in 0..<n {
        var minIndex = i
        for j in i+1..<n {
            if a[j] < a[minIndex] {
                minIndex = j
            }
        }
        a.swapAt(minIndex, i)
    }
    return a
}

/*
 插入排序，每次把待排序的元素插入到合适的位置，该位置的元素依次后移
 */
func insertSort(_ arr:[Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    var a = arr
    let n = arr.count
    for i in 1..<n {
        var pre = i - 1
        let cur = a[i]
        while pre >= 0 && a[pre] > cur {
            a[pre + 1] = a[pre]
            pre -= 1
            }
        a[pre+1] = cur
        }
    return a
}

/*
 希尔排序
 1959 年 Shell 发明，第一个突破 O(n2) 的排序算法，是简单插入排序的改进版。它与插入排序的不同之处在于，它会优先比较距离较远的元素。希尔排序又叫缩小增量排序。
 */

func shellSort (_ arr:[Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
   let n = arr.count
   var a = arr
    
    var gap = n / 2
    while gap > 0 {
        for i in gap..<n { //这里就是插入排序的操作，只是步长为gap的子序列的插入排序
            var j = i
            let cur = a[i]
            while j - gap >= 0 && cur < arr[j-gap] {
                a[j] = a[j-gap]
                j = j - gap
            }
            a[j] = cur
        }
        gap = gap / 2
    }
    return a
}

/*
 归并排序
 */
func mergeSort(_ arr:[Int]) -> [Int] {
    if arr.count < 2 {
        return arr
    }
    var a = arr
    let n = arr.count
    let middle = n / 2
    
    let left = Array(a[..<middle])
    let right = Array(a[middle...])
    return merge(mergeSort(left),mergeSort(right))
}

func merge(_ left:[Int], _ right:[Int]) -> [Int] {
    var res = [Int]()
    var i = 0
    var j = 0
    while i < left.count && j < right.count {
        if left[i] < right[j] {
            res.append(left[i])
            i += 1
        } else {
            res.append(right[j])
            j += 1
        }
    }
    while i < left.count {
        res.append(left[i])
        i += 1
    }
    while j < right.count {
        res.append(right[j])
        j += 1
    }
    return res
}

/*
 快速排序的核心是选择基准
 这里默认传入left 和 right 为 0 ,n - 1
 */
func quickSort(_ arr: inout [Int],_ left:Int, _ right:Int) -> [Int] {
    if left < right {
       let partionIndex = parttion(&arr, left, right)
        _ =  quickSort(&arr, left, partionIndex - 1)
        _ = quickSort(&arr, partionIndex+1, right)
    }
    
    return arr
}

/*
 根据左右边界返回 对应的基准的index
 */
func parttion(_ arr: inout [Int], _ left:Int, _ right:Int ) -> Int {
    let pivoit = left
    var index = pivoit + 1
    for i in index...right {
        if arr[i] < arr[pivoit] {
            arr.swapAt(i, index)
            index += 1
        }
    }
    arr.swapAt(pivoit, index-1)
    return index - 1
}


var a = [10,8,9,5,3,11,1,12]
//let b = mergeSort(a)
let b = quickSort(&a, 0, a.count-1)
print(b)



