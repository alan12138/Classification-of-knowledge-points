//
//  ViewController.m
//  block函数式编程
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "ATCalcManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ATCalcManager *mgr = [[ATCalcManager alloc] init];
    
    [[[[mgr calculate:^NSUInteger(NSUInteger result) {
        result += 1;
        return result;
    }] printResult:^(NSUInteger result) {
        NSLog(@"第一次计算结果为：%ld",result);
    }] calculate:^NSUInteger(NSUInteger result) {
        result -= 2;
        return result;
    }] printResult:^(NSUInteger result) {
        NSLog(@"第二次计算结果为：%ld",result);
    }];
}

@end
