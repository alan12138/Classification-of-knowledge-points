//
//  ViewController.m
//  block链式语法
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+ATCalc.h"
#import "ATCalcManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSUInteger a = 1,b = 2,c = 3,d = 4,e = 5;
    NSUInteger result = 0;
//    result = [self add:a b:b];
//    result = [self add:result b:c];
//    result = [self add:result b:d];
//    result = [self add:result b:e];
//    NSLog(@"%ld",result);
    
    result = [NSObject makeCalc:^(ATCalcManager *mgr) {
        mgr.add(a).add(b).add(c).add(d).add(e);
    }];
    NSLog(@"%ld",result);
}

- (NSUInteger)add:(NSUInteger)a b:(NSUInteger)b {
    return a + b;
}

@end
