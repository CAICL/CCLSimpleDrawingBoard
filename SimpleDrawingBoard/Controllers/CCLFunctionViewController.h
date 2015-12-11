//
//  CCLFunctionViewController.h
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/10.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableViewCell+CCLPopCell.h"

@interface CCLFunctionViewController : UITableViewController

@property (nonatomic,weak) id<CCLPopCellDelegate>delegate;
@end
