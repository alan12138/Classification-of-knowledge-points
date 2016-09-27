//
//  UITableViewCell+DWURunLoopWorkDistribution.m
//  RunLoopWorkDistribution
//
//  Created by 谷士雄 on 16/9/20.
//  Copyright © 2016年 Di Wu. All rights reserved.
//

#import "UITableViewCell+DWURunLoopWorkDistribution.h"
#import <objc/message.h>

@implementation UITableViewCell (DWURunLoopWorkDistribution)
@dynamic currentIndexPath;

- (NSIndexPath *)currentIndexPath {
    NSIndexPath *indexPath = objc_getAssociatedObject(self, @selector(currentIndexPath));
    return indexPath;
}

- (void)setCurrentIndexPath:(NSIndexPath *)currentIndexPath {
    objc_setAssociatedObject(self, @selector(currentIndexPath), currentIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
