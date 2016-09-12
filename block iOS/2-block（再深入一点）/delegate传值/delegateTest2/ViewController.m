//
//  ViewController.m
//  delegateTest2
//
//  Created by 谷士雄 on 16/7/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "ATNextViewController.h"

@interface ViewController ()<ATNextVcDelegate>
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;

}

- (void)btnClick:(UIButton *)btn {
    ATNextViewController *nextVc = [[ATNextViewController alloc] init];
    nextVc.delegate = self;
    [self.navigationController pushViewController:nextVc animated:YES];
}
#pragma mark - ATNextVcDelegate
- (void)inStr:(NSString *)inStr {
    NSLog(@"%@========", inStr);
}

@end
