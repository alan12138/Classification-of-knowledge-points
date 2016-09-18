//
//  ViewController.m
//  block保存代码块
//
//  Created by 谷士雄 on 16/9/18.
//  Copyright © 2016年 alan. All rights reserved.
//

#import "ViewController.h"
#import "ATTableViewCell.h"
#import "ATModel.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, weak) UITableView *mainTableView;
@property (nonatomic, strong) NSMutableArray *names;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UITableView *mainTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    mainTableView.delegate = self;
    mainTableView.dataSource = self;
    mainTableView.rowHeight = 100;
    [self.view addSubview:mainTableView];
    self.mainTableView = mainTableView;
    
    self.names = [NSMutableArray array];
    for (NSUInteger i = 0; i < 10; i++) {
        ATModel *model = [[ATModel alloc] init];
        model.name = [NSString stringWithFormat:@"alan--%ld",i];
        [self.names addObject:model];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.names.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    ATTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[ATTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.model = self.names[indexPath.row];
    
    cell.callBack = ^(ATModel *model) {
        NSLog(@"%ld---%@",indexPath.row,model.name);
    };
    return cell;
}


@end
