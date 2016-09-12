//
//  ATNextViewController.m
//  delegateTest2
//
//  Created by 谷士雄 on 16/7/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ATNextViewController.h"

@interface ATNextViewController ()
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ATNextViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
}
- (void)btnClick:(UIButton *)btn {
    if ([self.delegate respondsToSelector:@selector(inStr:)]) {
        [self.delegate inStr:@"红色"];
    }
    [self.navigationController popViewControllerAnimated:YES];
}
@end
