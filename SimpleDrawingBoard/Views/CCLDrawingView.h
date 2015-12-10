//
//  CCLDrawingView.h
//  SimpleDrawingBoard
//
//  Created by 蔡春雷 on 15/10/31.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCLSetting.h"
@interface CCLDrawingView : UIView
//用于接收控制器的传参
@property (nonatomic,strong) CCLSetting *setting;

@end
