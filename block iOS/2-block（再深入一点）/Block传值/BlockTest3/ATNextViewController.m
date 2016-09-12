//
//  ATNextViewController.m
//  BlockTest3
//
//  Created by 谷士雄 on 16/7/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ATNextViewController.h"

@interface ATNextViewController()
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ATNextViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",self.inStr);
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
}

- (void)btnClick:(UIButton *)btn {
    //block传值
    //自己确定需要传递信息的时机，这里是返回上一页的时候传值
    //用if判断一下是为了安全性，只有block确实存在的时候才会调用，否则会出问题
    if(self.testBlock) {
        //调用block成员变量
        self.testBlock(@"绿色");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}
@end
