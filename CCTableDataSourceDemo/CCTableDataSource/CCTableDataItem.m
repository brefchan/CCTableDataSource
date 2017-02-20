//
//  CCTableDataItem.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/16.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "CCTableDataItem.h"
#import "CCBaseTableHeaderView.h"
#import "CCBaseTableFooterView.h"
#import "CCBaseTableViewCell.h"
#import "UIView+CCUtil.h"

@implementation CCTableSectionDataItem

@end

@implementation CCTableCellDataItem

@end

@implementation CCTableDataItem

+ (instancetype)dataItem
{
    CCTableDataItem *item = [[CCTableDataItem alloc] init];
    return item;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray array];
    }
    return self;
}

- (id)firstData
{
    if (self.items && self.items.count > 0) {
        CCTableSectionDataItem *sectionData = [self.items objectAtIndex:0];
        if (sectionData && sectionData.cells && sectionData.cells.count > 0) {
            CCTableCellDataItem *cellData = [sectionData.cells firstObject];
            return cellData.cellData;
        }
    }
    return nil;
}

- (id)lastData
{
    if (self.items && self.items.count > 0) {
        CCTableSectionDataItem *sectionData = [self.items objectAtIndex:self.items.count - 1];
        if (sectionData && sectionData.cells && sectionData.cells.count > 0) {
            CCTableCellDataItem *cellData = [sectionData.cells lastObject];
            return cellData.cellData;
        }
    }
    return nil;
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem
{
    [self addHeaderClass:headerClass headerDataItem:headerItem headerDelegate:nil footerClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate
{
    [self addHeaderClass:headerClass headerDataItem:headerItem headerDelegate:headerDelegate footerClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem footerClass:(Class)footerClass footerDataItem:(id)footerItem
{
    [self addHeaderClass:headerClass headerDataItem:headerItem headerDelegate:nil footerClass:footerClass footerDataItem:footerItem footerDelegate:nil];
}

- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate footerClass:(Class)footerClass footerDataItem:(id)footerItem footerDelegate:(id)footerDelegate
{
    if (self.items) {
        CCTableSectionDataItem *sectionSource = [[CCTableSectionDataItem alloc] init];
        
        sectionSource.headerClass = headerClass;
        sectionSource.footerClass = footerClass;
        sectionSource.sectionHeaderData = headerItem;
        sectionSource.sectionFooterData = footerItem;
        sectionSource.sectionHeaderDelegate = headerDelegate;
        sectionSource.sectionFooterDelegate = footerDelegate;
    }
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem
{
    [self addHeaderNibClass:headerNibClass headerDataItem:headerItem headerDelegate:nil footerNibClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate
{
    [self addHeaderNibClass:headerNibClass headerDataItem:headerItem headerDelegate:headerDelegate footerNibClass:nil footerDataItem:nil footerDelegate:nil];
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem footerNibClass:(Class)footerNibClass footerDataItem:(id)footerItem
{
    [self addHeaderNibClass:headerNibClass headerDataItem:headerItem headerDelegate:nil footerNibClass:footerNibClass footerDataItem:footerItem footerDelegate:nil];
}

- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate footerNibClass:(Class)footerNibClass footerDataItem:(id)footerItem footerDelegate:(id)footerDelegate
{
    if (self.items) {
        CCTableSectionDataItem *sectionSource = [[CCTableSectionDataItem alloc] init];
        
        sectionSource.headerNibClass = headerNibClass;
        sectionSource.footerNibClass = footerNibClass;
        sectionSource.sectionHeaderData = headerItem;
        sectionSource.sectionFooterData = footerItem;
        sectionSource.sectionHeaderDelegate = headerDelegate;
        sectionSource.sectionFooterDelegate = footerDelegate;
    }
}


- (void)addCellClass:(Class)cellClass dataItem:(id)dataItem
{
    [self addCellClass:cellClass dataItems:@[dataItem] delegate:nil];
}

- (void)addCellClass:(Class)cellClass dataItem:(id)dataItem delegate:(id<NSObject>)delegate
{
    [self addCellClass:cellClass dataItems:@[dataItem] delegate:delegate];
}

- (void)addCellClass:(Class)cellClass dataItems:(NSArray *)dataItems
{
    [self addCellClass:cellClass dataItems:dataItems delegate:nil];
}

- (void)addCellClass:(Class)cellClass dataItems:(NSArray *)dataItems delegate:(id<NSObject>)delegate
{
    CCTableSectionDataItem *sectionSource = [self.items lastObject];
    
    if (self.items && !sectionSource) {
        sectionSource = [[CCTableSectionDataItem alloc] init];
        [self.items addObject:sectionSource];
    }
    
    if (sectionSource) {
        NSMutableArray *sectionCells = sectionSource.cells;
        
        if (!sectionCells) {
            sectionCells = [NSMutableArray array];
            sectionSource.cells = sectionCells;
        }
        
        if (dataItems) {
            for (id dataItem in dataItems) {
                CCTableCellDataItem *cellItem = [[CCTableCellDataItem alloc] init];
                
                cellItem.cellClassName = NSStringFromClass(cellClass);
                cellItem.cellData = dataItem;
                cellItem.cellDelegate = delegate;
                
                [sectionCells addObject:cellItem];
            }
        } else {
            CCTableCellDataItem *cellSource = [[CCTableCellDataItem alloc] init];
            
            cellSource.cellClassName = NSStringFromClass(cellClass);
            cellSource.cellDelegate = delegate;
            
            [sectionCells addObject:cellSource];
        }
    }
}

- (void)clearData
{
    if (self.items) {
        [self.items removeAllObjects];
    }
}

- (id)cellDataForIndexPath:(NSIndexPath *)indexPath
{
    CCTableSectionDataItem *sectionItem = self.items[indexPath.section];
    CCTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    return cellItem.cellData;

}

- (NSString *)cellClassNameForIndexPath:(NSIndexPath *)indexPath
{
    CCTableSectionDataItem *sectionItem = self.items[indexPath.section];
    CCTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    return cellItem.cellClassName;
}

- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath
{
    CCTableSectionDataItem *sectionItem = self.items[indexPath.section];
    CCTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    Class cellClass = NSClassFromString(cellItem.cellClassName);
    
    if ([cellClass isSubclassOfClass:[CCBaseTableViewCell class]]) {
        return [cellClass cellHeightForData:cellItem.cellData];
    }
    
    return 44.0f;
}

- (CGFloat)headerHeightForSection:(NSInteger)section
{
    CCTableSectionDataItem *sectionItem = self.items[section];
    
    Class headerClass = sectionItem.headerClass;
    
    if ([headerClass isSubclassOfClass:[CCBaseTableHeaderView class]]) {
        return [headerClass headerViewHeightForData:sectionItem.sectionHeaderData];
    }
    return 20.0f;
}

- (CGFloat)footerHeightForSection:(NSInteger)section
{
    CCTableSectionDataItem *sectionItem = self.items[section];
    
    Class footerClass = sectionItem.footerClass;
    
    if ([footerClass isSubclassOfClass:[CCBaseTableFooterView class]]) {
        return [footerClass footerViewHeightForData:sectionItem.sectionHeaderData];
    }
    return 20.0f;
}

- (id)sectionHeaderDataItemForSection:(NSInteger)section
{
    CCTableSectionDataItem *sectionItem = self.items[section];
    return sectionItem.sectionHeaderData;
}

- (id)sectionFooterDataItemForSection:(NSInteger)section
{
    CCTableSectionDataItem *sectionItem = self.items[section];
    return sectionItem.sectionFooterData;
}



@end
