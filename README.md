# CCTableDataSourceDemo
###UITableView数据源和代理封装,极大的提高开发效率

###介绍
  将UITableView的数据源和代理分别封装为CCTableViewDataSource和CCTableViewDelegate,分别依赖于数据管理类CCTableDataItem
  CCTableDataItem类以流的方式载入布局的信息,代码方面更加直观,写法也更加方便
  
###使用方法
  源码中有很详细的注释,使用起来也很快,核心思想是讲数据的显示和高度的计算交给Cell,HeaderView,FooterView来做,以Cell为例,只需要继承CCBaseTableViewCell,并且重写
```Objective-C
+ (CGFloat)cellHeightForData:(id)data;
- (void)bindData:(id)data;
```
 同时,只需要继承CCBaseTableViewCell还提供了动态计算Cell高度的方法,使用方法如下:
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
```
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






并将数据源和代理分别设置
