//
//  CCLSetting.h
//  SimpleDrawingBoard
//
//  Created by 蔡春雷 on 15/10/31.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CCLSetting : NSObject

@property (nonatomic,strong) UIColor *color;
@property (nonatomic) NSInteger lineWidth;
@property (nonatomic) BOOL isRubber;           //是不是橡皮
@end
