//
//  CCTableDataItem.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/16.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CCTableSectionDataItem : NSObject

@property (nonatomic, strong) Class headerClass;
@property (nonatomic, strong) Class footerClass;

@property (nonatomic, strong) Class headerNibClass;
@property (nonatomic, strong) Class footerNibClass;

@property (nonatomic, strong) NSString *sectionHeaderTitle;
@property (nonatomic, strong) NSString *sectionFooterTitle;

@property (nonatomic, strong) id sectionHeaderData;
@property (nonatomic, strong) id sectionFooterData;

@property (nonatomic, assign) id sectionHeaderDelegate;
@property (nonatomic, assign) id sectionFooterDelegate;

@property (nonatomic, strong) NSMutableArray *cells;

@end



@interface CCTableCellDataItem : NSObject

@property (nonatomic, strong) NSString *cellClassName;
@property (nonatomic, strong) id cellData;
@property (nonatomic, assign) id cellDelegate;

@end

@interface CCTableDataItem : NSObject


@property (nonatomic, strong) id firstData;
@property (nonatomic, strong) id lastData;

@property (nonatomic, strong) NSMutableArray *items;

+ (instancetype)dataItem;


/**
 设置区头视图类型以及相关数据
 
 @param headerClass 区头类型
 @param headerItem  区头相关数据
 */
- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem;

/**
 设置区头Nib视图类型以及相关数据
 
 @param headerNibClass 区头Nib类型
 @param headerItem  区头相关数据
 */
- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem;


/**
 设置区头视图类型和相关数据以及代理对象

 @param headerClass 区头类型
 @param headerItem 区头相关数据
 @param headerDelegate 代理对象
 */
- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate;

/**
 设置区头Nib视图类型和相关数据以及代理对象
 
 @param headerNibClass 区头Nib类型
 @param headerItem 区头相关数据
 @param headerDelegate 代理对象
 */
- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate;


/**
 分别设置区头区尾视图类型和相关数据

 @param headerClass 区头类型
 @param headerItem 区头相关数据
 @param footerClass 区尾类型
 @param footerItem 区尾相关类型
 */
- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem footerClass:(Class)footerClass footerDataItem:(id)footerItem;

/**
 分别设置区头区尾Nib视图类型和相关数据
 
 @param headerNibClass 区头Nib类型
 @param headerItem 区头相关数据
 @param footerNibClass 区尾Nib类型
 @param footerItem 区尾相关类型
 */
- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem footerNibClass:(Class)footerNibClass footerDataItem:(id)footerItem;

/**
 分别设置区头区尾视图类型和相关数据以及代理对象
 
 @param headerClass 区头类型
 @param headerItem 区头相关数据
 @param footerClass 区尾类型
 @param footerItem 区尾相关数据
 @param headerDelegate 区头代理
 @param footerDelegate 区尾代理
 */
- (void)addHeaderClass:(Class)headerClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate footerClass:(Class)footerClass footerDataItem:(id)footerItem footerDelegate:(id)footerDelegate;

/**
 分别设置区头区尾Nib视图类型和相关数据以及代理对象
 
 @param headerNibClass 区头Nib类型
 @param headerItem 区头相关数据
 @param footerNibClass 区尾Nib类型
 @param footerItem 区尾相关数据
 @param headerDelegate 区头代理
 @param footerDelegate 区尾代理
 */
- (void)addHeaderNibClass:(Class)headerNibClass headerDataItem:(id)headerItem headerDelegate:(id)headerDelegate footerNibClass:(Class)footerNibClass footerDataItem:(id)footerItem footerDelegate:(id)footerDelegate;

/**
 添加Cell类型和相关数据进当前区
 
 @param cellClass Cell类型
 @param dataItem 相关数据,与Cell类中的bindData:方法接收的参数类型一致
 */
- (void)addCellClass:(Class)cellClass dataItem:(id)dataItem;

/**
 添加Cell类型和相关数据以及代理对象进当前区
 
 @param cellClass Cell类型
 @param dataItem 相关数据,与Cell类中的bindData:方法接收的参数类型一致
 @param delegate 代理对象
 */
- (void)addCellClass:(Class)cellClass dataItem:(id)dataItem delegate:(id<NSObject>)delegate;

/**
 将相关数据数组中的数据分别与Cell类型添加进当前区
 
 @param cellClass Cell类型
 @param dataItems 相关数据数组
 */
- (void)addCellClass:(Class)cellClass dataItems:(NSArray *)dataItems;

/**
 讲相关数据数组中的数据分别与Cell类型和代理对象添加进当前区
 
 @param cellClass Cell类型
 @param dataItems 相关数据数组
 @param delegate 代理对象
 */
- (void)addCellClass:(Class)cellClass dataItems:(NSArray *)dataItems delegate:(id<NSObject>)delegate;


/**
 清除数据源
 */
- (void)clearData;


/**
 通过indexPath获取相关数据源
 
 @param indexPath 数据源索引,与Cell索引一致
 @return 相关数据源
 */
- (id)cellDataForIndexPath:(NSIndexPath *)indexPath;

/**
 通过indexPath获取相关Cell类型
 
 @param indexPath Cell索引
 @return 相关Cell类型
 */
- (NSString *)cellClassNameForIndexPath:(NSIndexPath *)indexPath;

/**
 通过indexPath获取相关Cell高度
 
 @param indexPath Cell索引
 @return 相关Cell高度
 */
- (CGFloat)cellHeightForIndexPath:(NSIndexPath *)indexPath;

/**
 通过section获取区头高度
 
 @param section 区索引
 @return 相关区头高度
 */
- (CGFloat)headerHeightForSection:(NSInteger)section;

/**
 通过section获取区尾高度
 
 @param section 区索引
 @return 相关区尾高度
 */
- (CGFloat)footerHeightForSection:(NSInteger)section;

/**
 通过区索引获取相关自定义区头数据
 
 @param section 区索引
 @return 相关自定义区头尾数据
 */
- (id)sectionHeaderDataItemForSection:(NSInteger)section;

/**
 通过区索引获取相关自定义区尾数据
 
 @param section 区索引
 @return 相关自定义区头尾数据
 */
- (id)sectionFooterDataItemForSection:(NSInteger)section;


@end
