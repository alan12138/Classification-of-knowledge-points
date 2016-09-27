//
//  ViewController.m
//  ShowPicture
//
//  Created by 谷士雄 on 16/9/19.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
    [imageView setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:imageView];
    self.imageView = imageView;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self useImageView];
}

- (void)useImageView
{
    // 只在NSDefaultRunLoopMode模式下显示图片(为了使滚动更加流畅，scroll滚动的时候不显示图片，尤其是当图片很大的时候尤其有意义)
    [self.imageView performSelector:@selector(setImage:) withObject:[UIImage imageNamed:@"appointment_duty_img"] afterDelay:1.0 inModes:@[NSDefaultRunLoopMode]];
}

@end
