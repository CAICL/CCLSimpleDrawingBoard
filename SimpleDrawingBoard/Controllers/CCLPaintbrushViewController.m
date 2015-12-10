//
//  CCLPaintbrushViewController.m
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/10.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import "CCLPaintbrushViewController.h"
#import "UIButton+CCLBtn.h"

@interface CCLPaintbrushViewController ()

@end

@implementation CCLPaintbrushViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//初始化模态视图大小
    if ([self respondsToSelector:@selector(setPreferredContentSize:)]) {
        self.preferredContentSize = CGSizeMake(70, 100);
    } else {
        self.contentSizeForViewInPopover = CGSizeMake(100, 1 * 44 - 1);
    }
//添加button
    
  CGRect frame = CGRectMake(20, 10, 40, 30);
    UIButton *lwOneBtn = [UIButton singleTitleButtonTitleNormal:@"线宽1" titleHighlighted:nil frame:frame];
    UIButton *lwTwoBtn = [UIButton singleTitleButtonTitleNormal:@"线宽2" titleHighlighted:nil frame:CGRectMake(20, 50, 40, 30)];
    
    [self.view addSubview:lwOneBtn];
    [self.view addSubview:lwTwoBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
