//
//  ViewController.m
//  RunloopObserver
//
//  Created by 谷士雄 on 16/9/19.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.btn = btn;
    //为当前runloop添加observer,以监听runloop的不同状态从而实现希望在特定状态执行的某些操作
    [self observer];
}
- (void)btnClick:(id)sender {
    NSLog(@"btnClick----------");
}

- (void)observer
{
    /**
     *  这个有一个常见应用场景是cell的高度缓存，这个操作应该在runloop空闲的时候进行，
     *  也就是块要休眠之前;还有一个是检测卡顿，后面会介绍。
     */
    // 创建observer，参数kCFRunLoopBeforeWaiting表示监听休眠前的状态，也就是在休眠前做一些操作
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopBeforeWaiting, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"do something---%zd", activity);
    });
    // 添加观察者：监听RunLoop的状态
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
    
    // 释放Observer
    CFRelease(observer);
}
@end
