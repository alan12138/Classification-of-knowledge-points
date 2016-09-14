//
//  ATCalcManager.m
//  block链式语法
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ATCalcManager.h"

@implementation ATCalcManager
- (ATCalcManager *(^)(NSUInteger s))add {
    return ^ATCalcManager *(NSUInteger x) {
        self.result += x;
        return self;
    };
}
@end
