//
//  ExampleHeaderView.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "ExampleHeaderView.h"

@implementation ExampleHeaderItem

@end



@interface ExampleHeaderView()
@property (weak, nonatomic) IBOutlet UILabel *exampleTitleLabel;
@property (weak, nonatomic) IBOutlet UIButton *rightExampleButton;

@end

@implementation ExampleHeaderView

@synthesize delegate = _delegate;


+ (CGFloat)headerViewHeightForData:(id)data
{
    return 40;
}

- (void)bindData:(ExampleHeaderItem *)data
{
    self.exampleTitleLabel.text = data.headerTitle;
    [self.rightExampleButton setTitle:data.buttonTitle forState:UIControlStateNormal];
}

- (IBAction)exampleButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(headerView:rightButtonClick:)])
        [self.delegate headerView:self rightButtonClick:sender];
}

- (id<ExampleHeaderViewDelegate>)delegate
{
    return _delegate;
}

- (void)setDelegate:(id<ExampleHeaderViewDelegate>)delegate
{
    _delegate = delegate;
}


@end
