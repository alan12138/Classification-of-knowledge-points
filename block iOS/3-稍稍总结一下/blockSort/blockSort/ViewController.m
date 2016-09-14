//
//  ViewController.m
//  blockSort
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
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    Person *p1 = [[Person alloc] init];
    p1.age = 9;
    Person *p2 = [[Person alloc] init];
    p2.age = 9;
    Person *p3 = [[Person alloc] init];
    p3.age = 2;
    Person *p4 = [[Person alloc] init];
    p4.age = 4;
    //不可变数组排序
//    NSArray *array = @[p1,p2,p3,p4];
//    
//    array = [array sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        Person *p1 = obj1;
//        Person *p2 = obj2;
//        
//        if (p1.age > p2.age)
//        {
//            return NSOrderedAscending; //返回和判断相反，降序，否则升序
//        }
//        else if (p1.age < p2.age)
//        {
//            return NSOrderedDescending;
//        }
//        else
//        {
//            return NSOrderedSame; //等序
//        }
//    }];
    
    //可变数组排序
    NSMutableArray *array = [NSMutableArray arrayWithObjects:p1,p2,p3,p4, nil];
    [array sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            Person *p1 = obj1;
            Person *p2 = obj2;
    
            if (p1.age > p2.age)
            {
                return NSOrderedAscending; //返回和判断相反，降序，否则升序
            }
            else if (p1.age < p2.age)
            {
                return NSOrderedDescending;
            }
            else
            {
                return NSOrderedSame; //等序
            }
    }];
    NSLog(@"%@",array);
    
}

@end
