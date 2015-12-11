//
//  CCLChooseColorViewController.h
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/11.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRColorPickerView.h"

@protocol HRColorPickerViewControllerDelegate
- (void)setSelectedColor:(UIColor *)color;
@end


@interface CCLChooseColorViewController : UIViewController

@property (weak) id <HRColorPickerViewControllerDelegate> delegate;

- (id)initWithColor:(UIColor *)defaultColor fullColor:(BOOL)fullColor;

@end

