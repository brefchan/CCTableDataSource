//
//  CCTableViewDelegate.h
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/15.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "CCTableDataItem.h"

@class CCTableDataSource;

//view
typedef UIView*(^ViewForHeaderInSection)(UITableView *tableView,NSInteger section,CCTableSectionDataItem *item);
typedef UIView*(^ViewForFooterInSection)(UITableView *tableView,NSInteger section,CCTableSectionDataItem *item);

//highlight
typedef void(^ShouldHighlightRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);
typedef void(^DidHighlightRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);
typedef void(^DidUnhighlightRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData);

//select
typedef NSIndexPath *(^WillSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData, NSString *cellClassName);
typedef NSIndexPath *(^WillDeselectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData, NSString *cellClassName);
typedef void(^DidSelectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData, NSString *cellClassName);
typedef void(^DidDeselectRowAtIndexPath)(UITableView *tableView,NSIndexPath *indexPath,id rowData, NSString *cellClassName);


@interface CCTableViewDelegate : NSObject<UITableViewDelegate>

/**
 等同于:
 - (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section;
 */
@property (nonatomic, copy) ViewForHeaderInSection viewForHeaderInSection;

- (void)setViewForHeaderInSection:(ViewForHeaderInSection)viewForHeaderInSection;

/**
 等同于:
 - (nullable UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
 */
@property (nonatomic, copy) ViewForFooterInSection viewForFooterInSection;

- (void)setViewForFooterInSection:(ViewForFooterInSection)viewForFooterInSection;

/**
 等同于:
 - (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath;
 */
@property (nonatomic, copy) ShouldHighlightRowAtIndexPath shouldHighlightRowAtIndexPath;

- (void)setShouldHighlightRowAtIndexPath:(ShouldHighlightRowAtIndexPath)shouldHighlightRowAtIndexPath;

/**
 等同于:
 - (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath;
 */
@property (nonatomic, copy) DidHighlightRowAtIndexPath didHighlightRowAtIndexPath;

- (void)setDidHighlightRowAtIndexPath:(DidHighlightRowAtIndexPath)didHighlightRowAtIndexPath;

/**
 等同于:
 - (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath;
 */
@property (nonatomic, copy) DidUnhighlightRowAtIndexPath didUnhighlightRowAtIndexPath;

- (void)setDidUnhighlightRowAtIndexPath:(DidUnhighlightRowAtIndexPath)didUnhighlightRowAtIndexPath;

/**
 等同于:
 - (nullable NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 */
@property (nonatomic, copy) WillSelectRowAtIndexPath willSelectRowAtIndexPath;

- (void)setWillSelectRowAtIndexPath:(WillSelectRowAtIndexPath)willSelectRowAtIndexPath;

/**
 等同于:
 - (nullable NSIndexPath *)tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath
 */
@property (nonatomic, copy) WillDeselectRowAtIndexPath willDeselectRowAtIndexPath;

- (void)setWillDeselectRowAtIndexPath:(WillSelectRowAtIndexPath)willSelectRowAtIndexPath;

/**
 等同于:
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
 */
@property (nonatomic, copy) DidSelectRowAtIndexPath didSelectRowAtIndexPath;

- (void)setDidSelectRowAtIndexPath:(DidSelectRowAtIndexPath)didSelectRowAtIndexPath;

/**
 等同于:
 - (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath;
 */
@property (nonatomic, copy) DidDeselectRowAtIndexPath didDeselectRowAtIndexPath;

- (void)setDidDeselectRowAtIndexPath:(DidDeselectRowAtIndexPath)didDeselectRowAtIndexPath;


+ (instancetype)delegateWithDataItem:(CCTableDataItem *)dataItem;

- (instancetype)initWithDataItem:(CCTableDataItem *)dataItem;


@end
