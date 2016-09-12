//
//  ATNextViewController.h
//  delegateTest2
//
//  Created by 谷士雄 on 16/7/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ATNextVcDelegate <NSObject>

@optional
- (void)inStr:(NSString *)inStr;
@end
@interface ATNextViewController : UIViewController
@property (nonatomic, weak) id<ATNextVcDelegate> delegate;
@end
