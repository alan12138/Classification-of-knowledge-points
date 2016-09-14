//
//  Person.m
//  block做返回值
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "Person.h"

@implementation Person
- (NSString *(^)(NSUInteger))speak {
    return ^ NSString * (NSUInteger a) {
        return [NSString stringWithFormat:@"my age is %ld", a];
    };
}

- (void (^)(NSUInteger))eat {
    return ^(NSUInteger a) {
        NSLog(@"eat 了 %ld 个鸭梨", a);
    };
}
@end
