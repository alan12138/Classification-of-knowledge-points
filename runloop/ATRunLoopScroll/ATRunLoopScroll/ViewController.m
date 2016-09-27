//
//  ViewController.m
//  ATRunLoopScroll
//
//  Created by 谷士雄 on 16/9/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, strong) dispatch_source_t GCDtimer;
@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    //1、主线程添加一个timer
//    [self timer];
    
    //2、子线程添加一个timer（两种方式）
    //子线程添加的runloop的定时器不会受主线程runloop的模式的影响，所以如果定时器在子线程runloop，主线程runloop无论有没有scroll滚动，也就是无论有没有改变runloop模式，子线程runloop定时器都不会受影响
    [self timer1];
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self timer];
//    });
    
    //3、在哪个线程执行由选择的队列决定(GCD创建的定时器不受runloop的影响)
//    [self useGCD];
    
}

- (void)timer
{
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    //添加一个定时器，需要将它添加到NSRunLoopCommonModes状态才能在scroll滚动的时候不受影响，常用于tableView或CollectionView中有轮播图的情况
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
    //子线程的情况下需要自己run,主线程注释掉这行代码
    [[NSRunLoop currentRunLoop] run];
}

- (void)run {
    NSLog(@"run--%@",[NSThread currentThread]);
}


- (void)timer1 {
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(timer) object:nil];
    //需要自己开启thread
    [self.thread start];
}

- (void)useGCD {
    // 获得队列
    //在子线程执行
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //在主线程执行
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 创建一个定时器(dispatch_source_t本质还是个OC对象)
    self.GCDtimer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // 设置定时器的各种属性（几时开始任务，每隔多长时间执行一次）
    // GCD的时间参数，一般是纳秒（1秒 == 10的9次方纳秒）
    // 比当前时间晚1秒开始执行
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC));
    
    //每隔一秒执行一次
    uint64_t interval = (uint64_t)(1.0 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.GCDtimer, start, interval, 0);
    
    // 设置回调
    dispatch_source_set_event_handler(self.GCDtimer, ^{
        NSLog(@"------------%@", [NSThread currentThread]);
        
    });
    
    // 启动定时器
    dispatch_resume(self.GCDtimer);
}
@end
