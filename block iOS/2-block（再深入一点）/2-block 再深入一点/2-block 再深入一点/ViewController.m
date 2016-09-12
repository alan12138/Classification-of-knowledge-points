//
//  ViewController.m
//  2-block 再深入一点
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
    //方法内部和外部直接定义+调用block
    [self blockTest1];
    printNumBlock(5);
    
}

//定义在方法外部
//定义一个有参数，没有返回值的Block
void (^printNumBlock)(int) = ^(int num){
    printf("int number is %d",num);
};

- (void)blockTest1 {
    //定义无参无返回值的Block
    void (^printBlock)() = ^(){
        printf("no number\n");
    };
    printBlock();
    
    printBlock(9);
    
    int mutiplier = 7;
    //定义名为myBlock的代码块，返回值类型为int
    int (^myBlock)(int) = ^(int num){
        return num * mutiplier;
    };
    //使用定义的myBlock
    printf("newMutiplier is %d\n",myBlock(3));

}
@end
