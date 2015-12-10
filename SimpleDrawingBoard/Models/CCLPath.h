//
//  CCLPath.h
//  SimpleDrawingBoard
//
//  Created by 蔡春雷 on 15/10/31.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCLSetting.h"
@interface CCLPath : NSObject

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) CCLSetting *setting;

@end
