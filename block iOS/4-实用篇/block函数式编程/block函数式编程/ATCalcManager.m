//
//  ATCalcManager.m
//  block函数式编程
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ATCalcManager.h"

@implementation ATCalcManager
- (instancetype)calculate:(NSUInteger (^)(NSUInteger result))calculateBlock
{
    _result =  calculateBlock(_result);
    return self;
}

-(instancetype)printResult:(void(^)(NSUInteger result))printBlock{
    printBlock(_result);
    return self;
}
@end
