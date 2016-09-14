//
//  Person.h
//  block做返回值
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

- (NSString * (^)(NSUInteger))speak;

- (void (^)(NSUInteger))eat;
@end
