//
//  ViewController.m
//  ResidentThread
//
//  Created by 谷士雄 on 16/9/19.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(run1) object:nil];
    self.thread.name = @"alan";
    [self.thread start];
}

//添加source避免runloop退出
- (void)run
{
    NSLog(@"----------run----%@", [NSThread currentThread]);
    //程序开始时创建，会看到一个默认的Autorelease pool,程序退出时销毁，按照对Autorelease的理解，岂不是所有autorelease pool里的对象在程序退出时才release， 这样跟内存泄露有什么区别？结果是，对于每一个Runloop， 系统会隐式创建一个Autorelease pool，这样所有的release pool会构成一个象CallStack一样的一个栈式结构，在每一个Runloop结束时，当前栈顶的Autorelease pool会被销毁，这样这个pool里的每个Object会被release。
    //thread是不会为runloop自动创建autorelease pool的，所以我们可以看到子线程中会有手动写的autorelease pool代码。
    @autoreleasepool{
        /*如果不加这句，会发现runloop创建出来就挂了，因为runloop如果没有CFRunLoopSourceRef事件源输入或者定时器，就会立马消亡。
         下面的方法给runloop添加一个NSport，就是添加一个事件源，也可以添加一个定时器，或者observer，让runloop不会挂掉*/
        [[NSRunLoop currentRunLoop] addPort:[NSPort port] forMode:NSDefaultRunLoopMode];
        
        [[NSRunLoop currentRunLoop] run];
    }
}

- (void)test
{
    NSLog(@"----------test----%@", [NSThread currentThread]);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(test) onThread:self.thread withObject:nil waitUntilDone:NO];
}


//添加timer避免runloop退出
- (void)run1 {
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(test) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    [[NSRunLoop currentRunLoop] run];
}
@end
