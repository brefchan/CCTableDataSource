//
//  ExampleFooterView.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCBaseTableFooterView.h"
@class ExampleFooterView;

@interface ExampleFooterItem : NSObject

@property (nonatomic, strong) NSString *titleString;
@property (nonatomic, strong) NSString *buttonString;

@end

@protocol ExampleFooterViewDelegate <NSObject>

- (void)footerView:(ExampleFooterView *)headerView leftButtonClick:(UIButton *)click;

@end

@interface ExampleFooterView : CCBaseTableFooterView

/**
 如果需要消除警告,可以在.m文件中加入
 @synthesize delegate = _delegate;
 并实现getter和setter方法,不实现也不会出现问题
 */

@property (nonatomic, weak) id<ExampleFooterViewDelegate> delegate;


@end
