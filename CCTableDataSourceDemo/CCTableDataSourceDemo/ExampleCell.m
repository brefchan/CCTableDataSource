//
//  ExampleCell.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "ExampleCell.h"
#import "UIImageView+WebCache.h"

@implementation ExampleCellItem

@end

@interface ExampleCell()

@property (weak, nonatomic) IBOutlet UIImageView *exampleCellImageView;
@property (weak, nonatomic) IBOutlet UILabel *exampleTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *exampleButton;


@end

@implementation ExampleCell
@synthesize delegate = _delegate;

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
    return 60;
}

- (void)bindData:(ExampleCellItem *)data
{
    self.exampleTitleLabel.text = data.titleString;
    [self.exampleButton setTitle:data.buttonString forState:UIControlStateNormal];
}

- (void)cellWillDisplayByData:(ExampleCellItem *)data
{
    //当cell在屏幕中显示时才加载图片
    [self.exampleCellImageView sd_setImageWithURL:[NSURL URLWithString:data.imageUrl]];
}

- (void)cellDidEndDisplayByData:(id)data
{
    //如果cell在屏幕中消失时图片还未下载完成,则取消下载
    [self.exampleCellImageView sd_cancelCurrentImageLoad];
}

- (IBAction)exampleButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(exampleCell:buttonClick:)])
        [self.delegate exampleCell:self buttonClick:sender];
}


#pragma mark - Getter && Setter
- (id<ExampleCellDelegate>)delegate
{
    return _delegate;
}

- (void)setDelegate:(id<ExampleCellDelegate>)delegate
{
    _delegate = delegate;
}



@end
