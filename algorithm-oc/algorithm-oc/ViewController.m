//
//  ViewController.m
//  algorithm-oc
//
//  Created by 缪雨轩 on 2020/2/27.
//  Copyright © 2020 miaoyuxuan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic , copy) NSMutableDictionary *numDict;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
   // NSLog(@"结果:%@",[self twoSum:@[@1,@5,@11,@23,@15,@6] target:38]);
    
   // NSLog(@"%d",[self reverse:-123890]);
    
    NSLog(@"%d",[self maxArea:@[@(1),@(8),@(6),@(2),@(5),@(4),@(8),@(3),@(7)]]);
}

- (NSArray *)twoSum:(NSArray *)nums target:(int)target {
    
    // for循环纪录下标值
    for (int i = 0; i < nums.count; i++) {
                
        // 字典numDict是否存在目标值减去数组中当前遍历到的值的差，存在这个值就代表已经找到两个值的和等于target
        if ([self.numDict.allKeys containsObject:[@(target - [nums[i] intValue]) stringValue]]) {
            
            // 直接返回这两个数字
            return @[@[[self.numDict valueForKey:[@(target - [nums[i] intValue]) stringValue]],@(i)]];
            
        } else {
            
            // 如果没找到就给numDict赋值，将之前的下标和值键值位置调换，这样是为了记录下标值
            [self.numDict setValue:[@(i) stringValue]  forKey:[nums[i] stringValue]];
            
        }
    }
    
    // 如果不存在就返回空
    return nil;
  
}

- (int)reverse:(int)x {
    
    // 新建X获取传入的数字
    int X = x;
    
    // 获取最大数字的最后一位
    int INT_MAX_LAST = INT_MAX % 10;
    
    // 获取最小数字的最后一位
    int INT_MIN_LAST = INT_MIN % 10;
    
    // 最大数字除10，用来预先判断
    int INT_MAX_PRE = INT_MAX / 10;

    // 最小数字除10，用来预先判断
    int INT_MIN_PRE = INT_MIN /10;
    
    // 新建int类型result用来存储结果
    int  result = 0;
    
    // 新建int类型pop用来存储最后一位
    int pop = 0;
    
    // 当数字不为0时参与运算
    while (X != 0) {
        
        // 获取数字最后一位
        pop = X % 10;
        
        // 除10移除最后一位，最后一位之后不参与运算
        X /= 10;
        
        // 判断当前计算后的结果是否符合当前和下一次运算
        if (result > INT_MAX_PRE || (result == INT_MAX_PRE && pop > INT_MAX_LAST)) {
            return 0;
        }
        
        if (result < INT_MIN_PRE || (result == INT_MIN_PRE && pop < INT_MIN_LAST)) {
            return 0;
        }
        
        // 当前的结果乘10，pop作为第一位直接加上去，这里的pop是X的最后一位
        result = result * 10 + pop;
        
    }
    return result;
}

- (int)maxArea:(NSArray *)height {
    
    // 新建变量maxWater为最大水量
    int maxWater = 0;
    
    // 初始左边的index
    int slowIndex = 0;
    
    // 初始最右边的index
    int fastIndex = (int)height.count - 1;
    
    // 当左边的index小于右边的index的时候才满足条件
    while (slowIndex < fastIndex) {
        
        // 宽度乘以高度（高度取数字比较小的那个，不然水会漏出来）
        int tempWater = (fastIndex - slowIndex) * MIN([height[slowIndex] intValue], [height[fastIndex] intValue]);
        
        // 比较计算出的水量大小，这个是多次循环比较
        maxWater = MAX(maxWater, tempWater);
        
        // 每次在计算结果之后都要开始计算其他位置，舍弃高度低的一个
        if ([height[slowIndex] intValue] < [height[fastIndex] intValue]) {
            slowIndex ++;
        } else {
            fastIndex --;
        }
    }
    return maxWater;
}

- (NSMutableDictionary *)numDict {
    if (!_numDict) {
        _numDict = [NSMutableDictionary new];
    }
    return _numDict;
}
@end
