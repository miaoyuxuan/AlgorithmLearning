//
//  ViewController.swift
//  algorithm-swift
//
//  Created by 缪雨轩 on 2020/2/28.
//  Copyright © 2020 miaoyuxuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        // print(twoSum([11,15,2,7], 9))
        
        // print(reverse(-1230))
        
        print(maxArea([1,8,6,2,5,4,8,3,7]))
    
    }

    
}

extension ViewController {
    
    // MARK: 求两数之和下边
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
           // 新建数组,用于颠倒位置存放数组中的数值和下标
    var dict = [Int : Int]()
    
           // 循环遍历给定的数组,获取到下标和对应下标的值,若为空则去else中执行代码
           for (i, num) in nums.enumerated() {
     
                  // 判断dict字典中是否存在target - num这个下标,如果存在就将对应下标的值给到lastIndex
                  if let lastIndex = dict[target - num] {
                       
                       // 返回两个下标之和等于target的下标
                       return [lastIndex ,i]
           
                  } else {
              
                       // 在判断了dict[target - num] 为空的情况下,将nums数组中的下标和对应的值位置颠倒存放在字典中,用于后面的数值相加等于target做判断
                       dict[num] = i
                  }
               
            }
    
            // 若找不到则打印No valid output!
            fatalError("No valid output!")
       }
    
    // MARK: 数字反转
    func reverse(_ x: Int) -> Int {
        var X = x
        let INT_MAX = Int(pow(2.0, 31.0) - 1)
        let INT_MIN = Int(-pow(2.0, 31.0))
        let INT_MAX_LAST = INT_MAX % 10
        let INT_MIN_LAST = INT_MIN % 10
        let INT_MAX_PRE = INT_MAX / 10
        let INT_MIN_PRE = INT_MIN / 10
        var result = 0
        var pop = 0
        while X != 0 {
            pop = X % 10
            X /= 10
            if result > INT_MAX_PRE || (result == INT_MAX_PRE && pop > INT_MAX_LAST) {
                return 0
            }
            if result < INT_MIN_PRE || (result == INT_MIN_PRE && pop < INT_MIN_LAST) {
                return 0
            }
            result = result * 10 + pop
        }
        return result
    }

    // MARK: 盛水最多的容器
    func maxArea(_ height: [Int]) -> Int {

        var maxWater = 0
        var slowIndex = 0
        var fastIndex = height.count - 1
        
        while slowIndex < fastIndex {
            let tempWater = (fastIndex - slowIndex) * min(height[slowIndex], height[fastIndex])
            maxWater = max(maxWater, tempWater)
            if height[slowIndex] < height[fastIndex] {
                slowIndex += 1
            } else {
                fastIndex -= 1
            }
        }
        return maxWater
    }
}

