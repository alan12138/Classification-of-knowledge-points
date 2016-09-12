//
//  ViewController.m
//  block
//
//  Created by 谷士雄 on 16/9/12.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    [self blockTest1];
//    [self blockTest2];
    //上面是block的一些简单定义和使用的方式，下面看一下block作为参数的简单使用
//    [self blockTest3:^int(int a) { //执行这行代码，会打印出9
//        return a * a;
//    }];
    //如果上面的示例不太明白的话，可以继续往下看，后面会介绍block做参数在实际开发工作中的具体使用场景。
    
    //下面看一下block对外部变量的使用
//    [self blockTest4];
    //可以把4和5对比来看
//    [self blockTest5];
    
    //对象引用，传址的情况
//    [self blockTest6];
    
    //如果外部变量不像上面一样是一个对象指针，那该怎么处理呢？
//    [self blockTest7];
    
    //静态变量全局只有一份，所以不管在哪里访问改变的都是a本身
//    [self blockTest8];
    
//    [self blockTest9];
    
    //全局变量也一样
    [self blockTest10];
}

int x = 8;
- (void)blockTest10 {

    int (^myBlock)(int) = ^(int b){
        x = 5;
        return x + b;
    };
    int result = myBlock(3);
    NSLog(@"%d", result); //8
}

- (void)blockTest9 {
    static int a = 8;
    int (^myBlock)(int) = ^(int b){
        a = 5;
        return a + b;
    };
    int result = myBlock(3);
    NSLog(@"%d", result); //4
}


- (void)blockTest8 {
    static int a = 8;
    int (^myBlock)(int) = ^(int b){
        return a + b;
    };
    a = 5;
    int result = myBlock(3);
    NSLog(@"%d", result); //8
}
- (void)blockTest7 {
    __block int a = 5; //加上__block前缀，就会传址进去
    int (^myBlock)(int) = ^(int b){
//        a = 2; //编译不再报错
        return a + b;
    };
    a = 7;
    int result = myBlock(3);
    //上面 a = 2 注释的情况下打印出的是10，解注释的情况下打印出的是5
    NSLog(@"%d", result);
    
}

- (void)blockTest6 {
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"one", @"two", @"three", nil];
    int result = ^(int a){
        [mutableArray removeLastObject]; //这里是传址而不是传值，因此这行代码会移除成功
        return a * a;
    }(5);
    
    NSLog(@"array :%@", mutableArray);
    NSLog(@"%d",result); //25
}

- (void)blockTest5 {
    //这段代码你会发现打印值依然未变，这是因为block对a的使用只是a的值的使用，而不是地址的引用，它在内部把a的值5作为常量来使用，因此在外部再改变a的值不会对block内部的a值造成任何影响，并且这时在block内部a是不能改变的，它在这里相当于一个常量。
    int a = 5;
    int (^myBlock)(int) = ^(int b){
//        a = 2; //编译报错
        return a + b;
    };
    a = 7;
    int result = myBlock(3);
    //依然打印出8
    NSLog(@"%d", result);
    
}

- (void)blockTest4 {
    int a = 5;
    int (^myBlock)(int) = ^(int b){
        return a + b;
    };

    int result = myBlock(3);
    //打印出8
    NSLog(@"%d", result);

}

 //square参数的类型是int(^)(int)
- (void)blockTest3:(int(^)(int))square{
    NSLog(@"%d",square(3));
}


- (void)blockTest2 {
    //声明一个名为square的block，并且返回值和参数都是int型
    int (^square)(int);
    //为square赋实体，类似函数内部的执行模块
    square = ^(int a){
        return a * a ;
    };
    //调用block，这里跟C函数调用一模一样
    int result = square(5);
    //这里打印值为25
    NSLog(@"%d", result);
}
- (void)blockTest1 {
    //直接使用一个block实体来进行计算
    //前面说过block某些方面跟函数非常相似，所以在这里
    //a相当于参数，return的值相当于返回值，5相当于传入的参数
    int result = ^(int a){
        return a * a;
    }(5);
    NSLog(@"%d",result); //打印值为25
    //当然，我们几乎不会这样去使用它
}
@end
