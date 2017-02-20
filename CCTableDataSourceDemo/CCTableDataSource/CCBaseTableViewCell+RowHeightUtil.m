//
//  CCBaseTableViewCell+RowHeightUtil.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "CCBaseTableViewCell+RowHeightUtil.h"
#import "UIView+CCUtil.h"

@implementation CCBaseTableViewCell (RowHeightUtil)

+ (CGFloat)dynamicCellHeightForStaticCell:(CCBaseTableViewCell *)cell data:(id)data cellClass:(Class)cellClass tableViewWidth:(CGFloat)width fromXib:(BOOL)isFromXib
{
    if (!cell) {
        if (isFromXib) {
            cell = [cellClass viewFromXib];
        }else
        {
            cell = [[cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass(cellClass)];
        }
    }
    
    [cell bindData:data];
    
    cell.bounds = CGRectMake(0.f, 0.f, width, CGRectGetHeight(cell.bounds));

    [cell setNeedsLayout];
    [cell layoutIfNeeded];
    
    [cell.contentView setNeedsLayout];
    [cell.contentView layoutIfNeeded];
    
    CGFloat height = [cell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height;

    height += 1;
    
    return height;
}

@end
