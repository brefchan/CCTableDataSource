//
//  ExampleHeaderView.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCBaseTableHeaderView.h"
@class ExampleHeaderView;

@interface ExampleHeaderItem : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *buttonTitle;

@end

@protocol ExampleHeaderViewDelegate <NSObject>

- (void)headerView:(ExampleHeaderView *)headerView rightButtonClick:(UIButton *)click;

@end


@interface ExampleHeaderView : CCBaseTableHeaderView

/**
如果需要消除警告,可以在.m文件中加入
@synthesize delegate = _delegate;
并实现getter和setter方法,不实现也不会出现问题
 */

@property (nonatomic, weak) id<ExampleHeaderViewDelegate> delegate;

@end
