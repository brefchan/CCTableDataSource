//
//  UITableView+CCUtil.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "UITableView+CCUtil.h"

@implementation UITableView (CCUtil)

- (void)registerNibCellClass:(Class)cellClass
{
    NSString *cellClassName = NSStringFromClass(cellClass);
    UINib *nibCell = [UINib nibWithNibName:cellClassName bundle:nil];
    
    [self registerNib:nibCell forCellReuseIdentifier:cellClassName];
}

- (void)registerCellClass:(Class)cellClass
{
    [self registerClass:cellClass forCellReuseIdentifier:NSStringFromClass(cellClass)];
}

- (void)registerCellClasses:(NSArray *)cellClasses
{
    for (Class cellClass in cellClasses) {
        [self registerCellClass:cellClass];
    }
}

- (void)registerNibCellClasses:(NSArray *)cellClasses
{
    for (Class cellClass in cellClasses) {
        [self registerNibCellClass:cellClass];
    }
}

@end
