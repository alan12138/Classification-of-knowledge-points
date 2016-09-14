//
//  NSObject+ATCalc.m
//  block链式语法
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "NSObject+ATCalc.h"
#import "ATCalcManager.h"

@implementation NSObject (ATCalc)
+ (NSUInteger)makeCalc:(void(^)(ATCalcManager *mgr))block {
    ATCalcManager *mgr = [[ATCalcManager alloc] init];
    block(mgr); //计算
    return mgr.result;
}
@end
