//
//  CCBaseTableViewCell.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/15.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCBaseTableViewCell : UITableViewCell

@property (nonatomic, assign) id<NSObject> delegate;

+ (CGFloat)cellHeightForData:(id)data;

/*
 必须实现,将数据显示在cell中
 **/

- (void)bindData:(id)data;

/*
 (可选)
 当cell出现或消失在屏幕中时进行的操作
 可以用来进行动画的相关操作,可以减少性能消耗
 **/
- (void)cellWillDisplayByData:(id)data;

- (void)cellDidEndDisplayByData:(id)data;

/*工具------用来计算动态cell高度-------**/
+ (CGFloat)dynamicCellHeightForStaticCell:(CCBaseTableViewCell *)cell data:(id)data cellClass:(Class)cellClass tableViewWidth:(CGFloat)width fromXib:(BOOL)isFromXib;



@end
