//
//  ViewController.m
//  block做返回值
//
//  Created by 谷士雄 on 16/9/14.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Person *p = [[Person alloc] init];
    
//    NSLog(@"%@",[p speak](5));
//    
//    [p eat](6);
    
    //其实上面这种做法是没有必要的，因为如果你真的想实现这种功能的话不需要多走一层block，但是这里是为了使用点语法实现链式调用，所以应该是下面这么用的
    NSLog(@"%@",p.speak(5));
    
    p.eat(6);
    
    //是不是感觉有点像Masonry中的链式语法,点语法调用函数，就是调用该函数的的getter方法
}

@end
