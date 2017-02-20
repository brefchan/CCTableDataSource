//
//  ExampleCell.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBaseTableViewCell.h"
@class ExampleCell;

@protocol ExampleCellDelegate <NSObject>

- (void)exampleCell:(ExampleCell *)cell buttonClick:(UIButton *)sender;

@end

@interface ExampleCellItem : NSObject

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *buttonString;
@property (nonatomic, strong) NSString *imageUrl;

@end

@interface ExampleCell : CCBaseTableViewCell

@property (nonatomic, weak) id<ExampleCellDelegate> delegate;

@end
