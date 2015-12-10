//
//  UIButton+CCLBtn.m
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/10.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import "UIButton+CCLBtn.h"

@implementation UIButton (CCLBtn)

+ (UIButton *)singleTitleButtonTitleNormal:(NSString *)titleNormal titleHighlighted:(NSString *)titleHighlighted frame:(CGRect)frame {
    UIButton *Btn = [UIButton buttonWithType:UIButtonTypeSystem];
    Btn.frame = frame;
    [Btn setTitle:titleNormal forState:UIControlStateNormal];
    [Btn setTitle:titleHighlighted forState:UIControlStateHighlighted];
    return Btn;
}

@end
