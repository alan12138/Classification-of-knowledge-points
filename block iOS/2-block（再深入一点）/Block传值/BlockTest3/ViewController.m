//
//  ViewController.m
//  BlockTest3
//
//  Created by 谷士雄 on 16/7/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "ATNextViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
}

- (void)btnClick:(UIButton *)btn {
    ATNextViewController *nextVc = [[ATNextViewController alloc] init];
    nextVc.inStr = @"红色"; //属性传值，用于顺传，直接传就好了
    
    //这里是block回传的值
    //在这里实现block的实体，并接收调用者传递过来的参数，这就实现了控制器之间传递信息
    nextVc.testBlock = ^(NSString *str) {
        NSLog(@"%@",str);
    };
    
    [self.navigationController pushViewController:nextVc animated:YES];
}

@end
