//
//  ATTableViewCell.h
//  block保存代码块
//
//  Created by 谷士雄 on 16/9/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ATModel;
@interface ATTableViewCell : UITableViewCell
@property (nonatomic, copy) ATModel *model;
//block名字为callBack ，传入参数NSString
@property(copy, nonatomic) void (^callBack)(ATModel *);
@end
