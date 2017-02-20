//
//  ExampleDataManager.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "ExampleDataManager.h"

#define HEADER_IAMGE_URL @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1487582396950&di=e3295aea3441d4a63f511dab4a8dbc47&imgtype=0&src=http%3A%2F%2Fwww.onegreen.net%2FQQ%2FUploadFiles%2F201301%2F20130113165409235.jpg"


@implementation ExampleDataManager


- (ExampleHeaderItem *)exampleHeaderData
{
    ExampleHeaderItem *headerItem = [[ExampleHeaderItem alloc] init];
    headerItem.headerTitle = @"无代理区头";
    headerItem.buttonTitle = @"点击不调用";
    return headerItem;
}

- (ExampleHeaderItem *)exampleHeaderDataWithDelegate
{
    ExampleHeaderItem *headerItem = [[ExampleHeaderItem alloc] init];
    headerItem.headerTitle = @"有代理区头";
    headerItem.buttonTitle = @"点击调用代理方法";
    return headerItem;
}

- (ExampleHeaderItem *)exampleDynamicHeaderData
{
    ExampleHeaderItem *headerItem = [[ExampleHeaderItem alloc] init];
    headerItem.headerTitle = @"动态高度cell区区头";
    headerItem.buttonTitle = @"点击不调用";
    return headerItem;
}

- (ExampleCellItem *)exampleCellData
{
    ExampleCellItem *cellItem = [[ExampleCellItem alloc] init];
    cellItem.titleString = @"单独设置的无代理cell";
    cellItem.buttonString = @"点击不调用";
    cellItem.imageUrl = HEADER_IAMGE_URL;
    return cellItem;
}

- (NSArray *)exampleCellDatasWithDelegate
{
    ExampleCellItem *cellItemOne = [[ExampleCellItem alloc] init];
    cellItemOne.titleString = @"数组设置cell有代理1";
    cellItemOne.buttonString = @"点击调用代理方法";
    cellItemOne.imageUrl = HEADER_IAMGE_URL;
    
    ExampleCellItem *cellItemTwo = [[ExampleCellItem alloc] init];
    cellItemTwo.titleString = @"数组设置cell有代理2";
    cellItemTwo.buttonString = @"点击调用代理方法";
    cellItemTwo.imageUrl = HEADER_IAMGE_URL;
    
    ExampleCellItem *cellItemThree = [[ExampleCellItem alloc] init];
    cellItemThree.titleString = @"数组设置cell有代理3";
    cellItemThree.buttonString = @"点击调用代理方法";
    cellItemThree.imageUrl = HEADER_IAMGE_URL;
    
    return @[cellItemOne,cellItemTwo,cellItemThree];
    
}

- (NSArray *)exampleDynamicDatas
{
    ExampleDynamicHeightCellItem *cellItemOne = [[ExampleDynamicHeightCellItem alloc] init];
    cellItemOne.dataString = @"动态高度Cell内容:\n在苍茫的大海上，狂风卷集着乌云。在乌云和大海之间，海燕像黑色的闪电，在高傲地飞翔。一会儿翅膀碰着波浪，一会儿箭一般地直冲向乌云，它叫喊着，——就在这鸟儿勇敢的叫喊声里，乌云听出了欢乐。";
    
    ExampleDynamicHeightCellItem *cellItemTwo = [[ExampleDynamicHeightCellItem alloc] init];
    cellItemTwo.dataString = @"动态高度Cell内容:\n在这叫喊声里——充满着对暴风雨的渴望！在这叫喊声里，乌云听出了愤怒的力量、热情的火焰和胜利的信心。";
    
    ExampleDynamicHeightCellItem *cellItemThree = [[ExampleDynamicHeightCellItem alloc] init];
    cellItemThree.dataString = @"动态高度Cell内容:\n海鸥在暴风雨来临之前呻吟着，——呻吟着，它们在大海上飞窜，想把自己对暴风雨的恐惧，掩藏到大海深处。海鸭也在呻吟着，——它们这些海鸭啊，享受不了生活的战斗的欢乐：轰隆隆的雷声就把它们吓坏了。蠢笨的企鹅，胆怯地把肥胖的身体躲藏在悬崖底下……只有那高傲的海燕，勇敢地，自由自在地，在泛起白沫的大海上飞翔！乌云越来越暗，越来越低，向海面直压下来，而波浪一边歌唱，一边冲向高空，去迎接那雷声。";
    
    return @[cellItemOne,cellItemTwo,cellItemThree];
}

- (ExampleFooterItem *)exampleFooterData
{
    ExampleFooterItem *footerItem = [[ExampleFooterItem alloc] init];
    footerItem.titleString = @"无代理区尾";
    footerItem.buttonString = @"点击不调用";
    return footerItem;
}

- (ExampleFooterItem *)exampleFooterDataWithDelegate
{
    ExampleFooterItem *footerItem = [[ExampleFooterItem alloc] init];
    footerItem.titleString = @"有代理区尾";
    footerItem.buttonString = @"点击调用代理方法";
    return footerItem;
}

- (ExampleFooterItem *)exampleDynamicFooterData
{
    ExampleFooterItem *footerItem = [[ExampleFooterItem alloc] init];
    footerItem.titleString = @"动态高度cell区区尾";
    footerItem.buttonString = @"点击不调用";
    return footerItem;
}



@end
