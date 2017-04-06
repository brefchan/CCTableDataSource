# CCTableDataSourceDemo
### UITableView数据源和代理封装,极大的提高开发效率
如果对您有所帮助,请赐予我一颗小小的星星
### 介绍
  将UITableView的数据源和代理分别封装为CCTableViewDataSource和CCTableViewDelegate,分别依赖于数据管理类CCTableDataItem
  CCTableDataItem类以流的方式载入布局的信息,代码方面更加直观,写法也更加方便
  
### 使用方法
  源码中有很详细的注释,使用起来也很快,核心思想是讲数据的显示和高度的计算交给Cell,HeaderView,FooterView来做,以Cell为例,只需要继承CCBaseTableViewCell,并且重写
```Objective-C
+ (CGFloat)cellHeightForData:(id)data;
- (void)bindData:(id)data;
```
 同时,CCBaseTableViewCell还提供了动态计算Cell高度的方法,使用方法如下:
 ```Objective-C
 @implementation ExampleDynamicHeightCell
 static ExampleDynamicHeightCell *staticCell = nil;
 
 + (CGFloat)cellHeightForData:(id)data
{
    return [self dynamicCellHeightForStaticCell:staticCell data:data cellClass:[ExampleDynamicHeightCell class] tableViewWidth:CGRectGetWidth([UIScreen mainScreen].bounds) fromXib:YES];
}
 
 @end
 ```
 
 
cellHeightForData方法根据传入的数据来返回Cell的高度,bindData用来显示数据,同时Cell还有2个可选方法可以选择性的重写
```Objective-C
- (void)cellWillDisplayByData:(id)data;
- (void)cellDidEndDisplayByData:(id)data;
```
分别对应UITableView的
```Objective-C
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
- (void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath*)indexPath
```
然后在视图控制器中创建数据管理类以及代理类和数据源类
```Objective-C
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
```






并将数据源和代理分别设置给TableView,并让TableView注册Cell,此方案提供了新的类别方法用来快速的注册Cell
```Objective-C
self.tableView.delegate = self.ccDelegate;
self.tableView.dataSource = self.ccDataSource;

[self.tableView registerNibCellClasses:@[[ExampleCell class],
                                         [ExampleDynamicHeightCell class]]];

```


CCTableViewDelegate是可高度定制的,分别针对所有的代理方法提供了block来进行控制,例如:
```Objective-C
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
```
最后可以来进行数据的绑定了,将数据和相关的Cell绑定在一起
```Objective-C
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

```


### 大功告成

当你使用这种方案,封装好了一个通用的Cell和headerView,FooterView以后,你会发现你开发一个页面会变得非常高效
