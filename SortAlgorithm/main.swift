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
            if i != index {
                arr.swapAt(i, index)
            }
            index += 1
        }
    }
    arr.swapAt(pivoit, index-1)
    return index - 1
}

/*
 堆调整
 */
func heapify(_ arr: inout [Int], _ i:Int, _ len:Int) {
    let left = 2 * i + 1
    let right = 2 * i + 2
    var largest = i
    
    if left < len && arr[left] > arr[largest] {
        largest = left
    }
    
    if right < len && arr[right] > arr[largest] {
        largest = right
    }
    if largest != i {
        arr.swapAt(i, largest)
        //如果交换了i和larget，可能破坏了底部已经完成的堆排序，重新调整
        //这里也可以使用非递归的方式进行调整
        heapify(&arr, largest,len)
    }
}

/*堆调整的非递归方式*/
func heapify2(_ arr: inout [Int], _ i:Int, _ len:Int) {
    var  i = i
    let tmp = arr[i]
    var k = 2 * i + 1
    while k < len {
        if (k + 1) < len && arr[k] < arr[k+1] {
            k += 1
        }
        
        if arr[k] > tmp {
            arr[i] = arr[k]
            i = k
        } else {
            break
        }
        k = 2 * k + 1
    }
    arr [i] = tmp
}

/*
 堆排序
 */
func heapSort(_ arr: inout [Int]) -> [Int] {
    let n = arr.count
    
    //找到第一个非叶子节点，然后开始调整。
    for i in (0...n/2).reversed() {
        heapify2(&arr, i,n)
    }
    print(arr)
    
    for i in (0..<arr.count).reversed() {
        arr.swapAt(0, i)//替换到最后一个元素到堆顶并移除堆顶元素。
        heapify2(&arr, 0,i)
    }
    return arr
}


/*
 计算排序。 counting Sort
 */

func countingSort(_ arr:[Int]) -> [Int] {
    if arr.count <= 1 {
        return arr
    }
    var a = arr;
    let maxV = a.max()
    var bucket = [Int](repeating: 0, count:maxV! + 1)
    for (_,v) in arr.enumerated() {
        bucket[v] += 1
    }
    
    var index = 0
    for (j,v) in bucket.enumerated() {
        var count = v
        while count > 0 {
            a[index] = j
            index += 1
            count = count - 1
        }
    }
    return a
}

/*
 9、桶排序（Bucket Sort）
 目前先不写桶排序
 算法描述
 取得数组中的最大数，并取得位数；
 arr 为原始数组，从最低位开始取每个位组成 radix 数组；
 对 radix 进行计数排序（利用计数排序适用于小范围数的特点）；
 */
func radixSort(_ arr:[Int]) -> [Int] {
    var mod = 10
    var dev = 1
    return [Int]()
}


func sumOfN(_ n:Int) -> Int {
    if n == 1 {
        return 1
    }
    return sumOfN(n-1) + n
}




var a = [4,6,8,5,9,1,13,7]
//let b = quickSort(&a, 0, a.count-1)
let b = countingSort(a)
print(b)



