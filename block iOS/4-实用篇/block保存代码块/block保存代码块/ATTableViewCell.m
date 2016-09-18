//
//  ATTableViewCell.m
//  block保存代码块
//
//  Created by 谷士雄 on 16/9/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ATTableViewCell.h"
#import "ATModel.h"

@interface ATTableViewCell ()
@property (nonatomic, weak) UIButton *btn;
@end

@implementation ATTableViewCell
- (void)setModel:(ATModel *)model {
    _model = model;
    [self.btn setTitle:model.name forState:UIControlStateNormal];
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(5, 5, 80, 80)];
        [btn setTitle:@"alan" forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
        self.btn = btn;
    }
    return self;
}

- (void)btnClick:(UIButton *)btn {
    if (self.callBack) {
        self.callBack(self.model);
    }
}
@end
