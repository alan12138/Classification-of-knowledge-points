//
//  ATCalcManager.h
//  block函数式编程
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCalcManager : NSObject
@property (nonatomic, assign) NSUInteger result;
- (instancetype)calculate:(NSUInteger(^)(NSUInteger result))calculateBlock;
-(instancetype)printResult:(void(^)(NSUInteger result))printBlock;
@end
