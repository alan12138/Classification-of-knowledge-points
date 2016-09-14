//
//  ViewController.m
//  3-实用篇
//
//  Created by 谷士雄 on 16/9/13.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"

// 定义一种无返回值无参数列表的Block类型
typedef void(^myBlock)();

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testBlock6];
    
}

// 1.使用typedef定义Block类型(这个一般放在最上面，这里为了区分不同模块暂时放在这里)
typedef int(^MyBlock)(int, int);

// 2.定义一个形参为Block的OC函数
- (void)useBlockForOC1:(MyBlock)aBlock
{
    NSLog(@"%d", aBlock(3,2));
}

- (void)testBlock6 {
    // 3.声明并赋值定义一个Block变量
    MyBlock addBlock = ^(int x, int y){
        return x + y;
    };
    
    // 4.以Block作为函数参数,把Block像对象一样传递
    [self useBlockForOC1:addBlock];
    
    // 将第3点和第4点合并一起,以内联定义的Block作为函数参数
    [self useBlockForOC1:^(int x, int y){
        return x * y;
    }];
}


// 1.定义一个形参为Block的OC函数
- (void)useBlockForOC:(int(^)(int, int))aBlock
{
    NSLog(@"%d\n", aBlock(3,2));
}

- (void)testBlock5 {
    // 2.声明并赋值定义一个Block变量
    int(^addBlock)(int, int) = ^(int x, int y){
        return x + y;
    };
    
    // 3.以Block作为函数参数,把Block像对象一样传递
    [self useBlockForOC:addBlock];
    
    // 将第2点和第3点合并一起,以内联定义的Block作为函数参数
    [self useBlockForOC:^(int x, int y){
        return x * y;
    }];
}

// 1.定义一个形参为Block的C函数
void useBlockForC(int(^myBlock)(int, int))
{
    NSLog(@"%d\n", myBlock(3,2));
}

- (void)testBlock4 {
    
    // 2.声明并赋值定义一个Block变量
    int(^addBlock)(int, int) = ^(int x, int y){
        return x + y;
    };
    
    // 3.以Block作为函数参数,把Block像对象一样传递
    useBlockForC(addBlock);
    
    // 将第2点和第3点合并一起,以内联定义的Block作为函数参数(一般这么用)
    useBlockForC(^int(int x, int y) {
        return x * y;
    });
}

//这种定义方式（typedef）常用且方便
- (void)testBlock3 {
    // 我们可以像OC中声明变量一样使用Block类型myBlock来声明变量
    myBlock hello = ^(){
        NSLog(@"hello");
    };
    
    // 调用后控制台输出"hello"
    hello();
}

//声明并直接赋值实体(不常用)
- (void)testBlock2 {
    // 如果没有参数列表,在赋值时参数列表可以省略
    void(^myBlock)() = ^{
        NSLog(@"I love you");
    };
    myBlock();
}

//简单声明+调用（不常用）
- (void)testBlock1 {
    //Block变量的声明格式为: 返回值类型(^Block名字)(参数列表);
    
    // 声明一个无返回值,参数为两个字符串对象,叫做myBlock的Block
//    void (^myBlock)(NSString *x, NSString *y);
    
    // 形参变量名称可以省略,只留有变量类型即可
    void (^myBlock)(NSString *, NSString *);
    
    //Block变量的赋值格式为: Block变量 = ^(参数列表){函数体};
    myBlock = ^(NSString *x, NSString *y){
        NSLog(@"%@ love %@", x, y);
    };
    
    myBlock(@"I",@"you");
}
@end
