//
//  ExampleDataManager.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExampleHeaderView.h"
#import "ExampleFooterView.h"
#import "ExampleCell.h"
#import "ExampleDynamicHeightCell.h"


@interface ExampleDataManager : NSObject

- (ExampleHeaderItem *)exampleHeaderData;

- (ExampleHeaderItem *)exampleHeaderDataWithDelegate;

- (ExampleHeaderItem *)exampleDynamicHeaderData;

- (ExampleCellItem *)exampleCellData;

- (NSArray *)exampleCellDatasWithDelegate;

- (NSArray *)exampleDynamicDatas;

- (ExampleFooterItem *)exampleFooterData;

- (ExampleFooterItem *)exampleFooterDataWithDelegate;

- (ExampleFooterItem *)exampleDynamicFooterData;


@end
