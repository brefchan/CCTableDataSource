//
//  CCBaseTableViewCell.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/15.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "CCBaseTableViewCell.h"

@implementation CCBaseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeightForData:(id)data
{
    return 44;
}

- (void)bindData:(id)data
{

}

- (void)cellWillDisplayByData:(id)data
{

}

- (void)cellDidEndDisplayByData:(id)data
{
    
}

@end
