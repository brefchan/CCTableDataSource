//
//  CCDataSource.h
//  CCTableDataSourceDemo
//
//  Created by BrefChan on 17/2/15.
//  Copyright © 2017年 BrefChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CCTableDataItem.h"

@interface CCTableViewDataSource : NSObject

+ (instancetype)dataSourceWithItem:(CCTableDataItem *)dataItem;

- (instancetype)initWithDataItem:(CCTableDataItem *)dataItem;


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;


@end
