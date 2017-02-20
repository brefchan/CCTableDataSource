//
//  ExampleDynamicHeightCell.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/20.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "ExampleDynamicHeightCell.h"

@implementation ExampleDynamicHeightCellItem

@end

@interface ExampleDynamicHeightCell()

@property (weak, nonatomic) IBOutlet UILabel *dynamicLabel;

@end

@implementation ExampleDynamicHeightCell

static ExampleDynamicHeightCell *staticCell = nil;

+ (CGFloat)cellHeightForData:(id)data
{
    return [self dynamicCellHeightForStaticCell:staticCell data:data cellClass:[ExampleDynamicHeightCell class] tableViewWidth:CGRectGetWidth([UIScreen mainScreen].bounds) fromXib:YES];
}

- (void)bindData:(ExampleDynamicHeightCellItem *)data
{
    self.dynamicLabel.text = data.dataString;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
