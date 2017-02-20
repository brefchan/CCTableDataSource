//
//  CCBaseTableViewCell+RowHeightUtil.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "CCBaseTableViewCell.h"

@interface CCBaseTableViewCell (RowHeightUtil)

+ (CGFloat)dynamicCellHeightForStaticCell:(CCBaseTableViewCell *)cell data:(id)data cellClass:(Class)cellClass tableViewWidth:(CGFloat)width fromXib:(BOOL)isFromXib;

@end
