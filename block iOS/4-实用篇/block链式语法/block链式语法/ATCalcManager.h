//
//  ATCalcManager.h
//  block链式语法
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCalcManager : NSObject
@property (nonatomic, assign) NSUInteger result;

- (ATCalcManager *(^)(NSUInteger s))add;

@end
