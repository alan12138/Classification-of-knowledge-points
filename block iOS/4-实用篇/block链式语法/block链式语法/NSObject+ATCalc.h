//
//  NSObject+ATCalc.h
//  block链式语法
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ATCalcManager;
@interface NSObject (ATCalc)
+ (NSUInteger)makeCalc:(void(^)(ATCalcManager *mgr))block;
@end
