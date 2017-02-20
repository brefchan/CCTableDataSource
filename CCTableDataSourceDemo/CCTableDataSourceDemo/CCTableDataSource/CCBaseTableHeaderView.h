//
//  CCBaseTableHeaderView.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/15.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCBaseTableHeaderView : UIView

@property (nonatomic, weak) id delegate;

/**
 必须实现,根据数据返回视图高度
 */
+ (CGFloat)headerViewHeightForData:(id)data;

/*
 必须实现,将数据显示在header中
 **/

- (void)bindData:(id)data;

/*
 (可选)
 当header出现或消失在屏幕中时进行的操作
 可以用来进行动画的相关操作,可以减少性能消耗
 **/
- (void)headerWillDisplayByData:(id)data;

- (void)headerDidEndDisplayByData:(id)data;


@end
