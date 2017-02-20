//
//  UITableView+CCUtil.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (CCUtil)

- (void)registerNibCellClass:(Class)cellClass;

- (void)registerNibCellClasses:(NSArray *)cellClasses;

- (void)registerCellClass:(Class)cellClass;

- (void)registerCellClasses:(NSArray *)cellClasses;

@end
