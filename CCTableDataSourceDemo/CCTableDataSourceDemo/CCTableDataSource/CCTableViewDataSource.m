//
//  CCDataSource.m
//  CCTableDataSourceDemo
//
//  Created by BrefChan on 17/2/15.
//  Copyright © 2017年 BrefChan. All rights reserved.
//

#import "CCTableViewDataSource.h"
#import "CCBaseTableViewCell.h"

@interface CCTableViewDataSource()

@property (nonatomic, strong) CCTableDataItem *dataItem;

@end


@implementation CCTableViewDataSource

+ (instancetype)dataSourceWithItem:(CCTableDataItem *)dataItem
{
    CCTableViewDataSource *dataSource = [[CCTableViewDataSource alloc] initWithDataItem:dataItem];
    return dataSource;
}

- (instancetype)initWithDataItem:(CCTableDataItem *)dataItem
{
    self = [super init];
    if (self) {
        self.dataItem = dataItem;
    }
    return self;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataItem.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    CCTableSectionDataItem *sectionItem = self.dataItem.items[section];
    
    return sectionItem.cells.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCTableSectionDataItem *sectionItem = self.dataItem.items[indexPath.section];
    CCTableCellDataItem *cellItem = sectionItem.cells[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellItem.cellClassName forIndexPath:indexPath];
    
    if ([cell isKindOfClass:[CCBaseTableViewCell class]]) {
        CCBaseTableViewCell *tableViewCell = (CCBaseTableViewCell *)cell;
        
        tableViewCell.delegate = cellItem.cellDelegate;
        
        [tableViewCell bindData:cellItem.cellData];
    }
    
    return cell;
}



@end
