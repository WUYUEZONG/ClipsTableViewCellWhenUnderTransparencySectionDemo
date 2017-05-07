//
//  UITableViewCell+Extra.h
//  THEWEATHER
//
//  Created by WUYUEZONG on 2017/5/7.
//  Copyright © 2017年 WUYUEZONG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Extra)

/// 当Section为透明时，剪除超出边界的cell
- (void)clipOutSideCellWhenUnderTransparencySectionSetMaskFrame:(CGRect)frame;

@end
