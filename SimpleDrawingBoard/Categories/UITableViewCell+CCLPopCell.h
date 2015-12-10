//
//  UITableViewCell+CCLPopCell.h
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/10.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CCLPopCellDelegate <NSObject>
@required
- (void)CCLPopCell:(UITableViewCell *)cell selectedCellAtIndex:(NSInteger)cellIndex;

@end
@interface UITableViewCell (CCLPopCell)

@end
