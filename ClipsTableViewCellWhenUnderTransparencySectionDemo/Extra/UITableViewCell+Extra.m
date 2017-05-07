//
//  UITableViewCell+Extra.m
//  THEWEATHER
//
//  Created by WUYUEZONG on 2017/5/7.
//  Copyright © 2017年 WUYUEZONG. All rights reserved.
//

#import "UITableViewCell+Extra.h"

@implementation UITableViewCell (Extra)

- (void)clipOutSideCellWhenUnderTransparencySectionSetMaskFrame:(CGRect)frame {
    CALayer *maskLayer = [CALayer layer];
    maskLayer.backgroundColor = [UIColor whiteColor].CGColor;
    maskLayer.frame = frame;
    self.layer.mask = maskLayer;
}


@end
