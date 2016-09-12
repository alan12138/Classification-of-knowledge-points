//
//  ATNextViewController.h
//  BlockTest3
//
//  Created by 谷士雄 on 16/7/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <UIKit/UIKit.h>

//一般都会用这种方式声明一个block类型(返回值类型为空，参数类型为字符串)
typedef void (^TestBlock) (NSString *str);

@interface ATNextViewController : UIViewController
@property (nonatomic, copy) NSString *inStr;
//一般使用copy策略，因为在ARC环境下已经不再有存储在栈中的block了，而是在堆中。声明一个TestBlock类型的变量
@property (nonatomic, copy) TestBlock testBlock;
@end
