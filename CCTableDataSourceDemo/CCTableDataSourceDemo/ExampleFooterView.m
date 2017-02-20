//
//  ExampleFooterView.m
//  CCTableDataSourceDemo
//
//  Created by eHome on 17/2/17.
//  Copyright © 2017年 brefChan. All rights reserved.
//

#import "ExampleFooterView.h"

@implementation ExampleFooterItem

@end


@interface ExampleFooterView()

@property (weak, nonatomic) IBOutlet UIButton *leftButton;

@property (weak, nonatomic) IBOutlet UILabel *footerTitleLabel;

@end

@implementation ExampleFooterView
@synthesize delegate = _delegate;

+ (CGFloat)footerViewHeightForData:(id)data
{
    return 30;
}

- (void)bindData:(ExampleFooterItem *)data
{
    [self.leftButton setTitle:data.buttonString forState:UIControlStateNormal];
    self.footerTitleLabel.text = data.titleString;
}

- (IBAction)leftButtonClick:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(footerView:leftButtonClick:)])
        [self.delegate footerView:self leftButtonClick:sender];
}

#pragma mark - Getter && Setter
- (id<ExampleFooterViewDelegate>)delegate
{
    return _delegate;
}

- (void)setDelegate:(id<ExampleFooterViewDelegate>)delegate
{
    _delegate = delegate;
}

@end
