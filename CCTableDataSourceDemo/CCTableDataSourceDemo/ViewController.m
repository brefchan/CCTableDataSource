//
//  ViewController.m
//  CCTableDataSourceDemo
//
//  Created by BrefChan on 17/2/15.
//  Copyright © 2017年 BrefChan. All rights reserved.
//

#import "ViewController.h"
#import "CCTableDataSourceHeader.h"
#import "ExampleDataManager.h"
#import "ExampleCell.h"
#import "ExampleDynamicHeightCell.h"
#import "ExampleHeaderView.h"
#import "ExampleFooterView.h"

@interface ViewController ()
<
ExampleHeaderViewDelegate,
ExampleFooterViewDelegate,
ExampleCellDelegate
>

@property (nonatomic, strong) CCTableDataItem *dataItem;
@property (nonatomic, strong) CCTableViewDelegate *ccDelegate;
@property (nonatomic, strong) CCTableViewDataSource *ccDataSource;

@property (nonatomic, strong) ExampleDataManager *dataManager;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //tableView初始化
    self.tableView.delegate = self.ccDelegate;
    self.tableView.dataSource = self.ccDataSource;
    
    [self.tableView registerNibCellClasses:@[[ExampleCell class],
                                             [ExampleDynamicHeightCell class]]];
    
    [self.view addSubview:self.tableView];
    
    [self setTableDelegate];
    
    [self bindData];
}

- (void)setTableDelegate
{
    [self.ccDelegate setDidSelectRowAtIndexPath:^(UITableView *tableView, NSIndexPath *indexPath, id rowData, NSString *cellClassName) {
        
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
        if ([rowData isKindOfClass:[ExampleCellItem class]]) {
            ExampleCellItem *cellItem = (ExampleCellItem *)rowData;
            NSLog(@"该单元格对应的数据源标题为:%@\n对应的按钮标题为:%@",cellItem.titleString,cellItem.buttonString);
        }else if ([rowData isKindOfClass:[ExampleDynamicHeightCellItem class]])
        {
            ExampleDynamicHeightCellItem *dynamicCellItem = (ExampleDynamicHeightCellItem *)rowData;
            NSLog(@"点击的是动态高度单元格,该单元格对应的数据源内容为:\n%@",dynamicCellItem.dataString);
        }
    }];
}

- (void)bindData
{
    [self.dataItem clearData];
    
    //创建无代理的区头区尾
    [self.dataItem addHeaderNibClass:[ExampleHeaderView class]
                      headerDataItem:[self.dataManager exampleHeaderData]
                      footerNibClass:[ExampleFooterView class]
                      footerDataItem:[self.dataManager exampleFooterData]];
    
    [self.dataItem addCellClass:[ExampleCell class] dataItem:[self.dataManager exampleCellData]];
    
    //创建有代理的区头区尾
    [self.dataItem addHeaderNibClass:[ExampleHeaderView class]
                      headerDataItem:[self.dataManager exampleHeaderDataWithDelegate]
                      headerDelegate:self footerNibClass:[ExampleFooterView class]
                      footerDataItem:[self.dataManager exampleFooterDataWithDelegate]
                      footerDelegate:self];
    
    [self.dataItem addCellClass:[ExampleCell class] dataItems:[self.dataManager exampleCellDatasWithDelegate] delegate:self];
    
    //创建动态高度区
    [self.dataItem addHeaderNibClass:[ExampleHeaderView class]
                      headerDataItem:[self.dataManager exampleDynamicHeaderData]
                      footerNibClass:[ExampleFooterView class]
                      footerDataItem:[self.dataManager exampleDynamicFooterData]];
    
    [self.dataItem addCellClass:[ExampleDynamicHeightCell class] dataItems:[self.dataManager exampleDynamicDatas]];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Delegate

#pragma mark ExampleHeaderViewDelegate
- (void)headerView:(ExampleHeaderView *)headerView rightButtonClick:(UIButton *)click
{
    NSLog(@"调用区头代理方法");
}

#pragma mark ExampleFooterViewDelegate
- (void)footerView:(ExampleFooterView *)headerView leftButtonClick:(UIButton *)click
{
    NSLog(@"调用区尾代理方法");
}

#pragma mark ExampleCellDelegate
- (void)exampleCell:(ExampleCell *)cell buttonClick:(UIButton *)sender
{
    NSLog(@"调用cell代理方法");
}

#pragma mark - Getter && Setter
- (CCTableDataItem *)dataItem
{
    if (!_dataItem) {
        _dataItem = [CCTableDataItem dataItem];
    }
    return _dataItem;
}

- (CCTableViewDelegate *)ccDelegate
{
    if (!_ccDelegate) {
        _ccDelegate = [CCTableViewDelegate delegateWithDataItem:self.dataItem];
    }
    return _ccDelegate;
}

- (CCTableViewDataSource *)ccDataSource
{
    if (!_ccDataSource) {
        _ccDataSource = [CCTableViewDataSource dataSourceWithItem:self.dataItem];
    }
    return _ccDataSource;
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    }
    return _tableView;
}

- (ExampleDataManager *)dataManager
{
    if (!_dataManager) {
        _dataManager = [[ExampleDataManager alloc] init];
    }
    return _dataManager;
}


@end
