//
//  CCLBackgroundViewController.m
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/10.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import "CCLBackgroundViewController.h"
#import "UIButton+CCLBtn.h"

@interface CCLBackgroundViewController ()

@end

@implementation CCLBackgroundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //初始化模态视图大小
    if ([self respondsToSelector:@selector(setPreferredContentSize:)]) {
        self.preferredContentSize = CGSizeMake(170, 120);
    } else {
        self.contentSizeForViewInPopover = CGSizeMake(100, 1 * 44 - 1);
    }
    //添加按钮
    [self addButton];
}
- (void)addButton {

    CGRect firstBtnFrame = CGRectMake(10, 10, 40, 40);
    UIButton *button = [UIButton singleTitleButtonTitleNormal:@"红" titleHighlighted:nil frame:firstBtnFrame];
    UIButton *button1 = [UIButton singleTitleButtonTitleNormal:@"黑" titleHighlighted:nil frame:CGRectMake(70, 10, 40, 40)];
    UIButton *button2 = [UIButton singleTitleButtonTitleNormal:@"绿" titleHighlighted:nil frame:CGRectMake(120, 10, 40, 40)];
    UIButton *button3 = [UIButton singleTitleButtonTitleNormal:@"黄" titleHighlighted:nil frame:CGRectMake(10, 70, 40, 40)];
    UIButton *button4 = [UIButton singleTitleButtonTitleNormal:@"紫" titleHighlighted:nil frame:CGRectMake(70, 70, 40, 40)];
    UIButton *button5 = [UIButton singleTitleButtonTitleNormal:@"蓝" titleHighlighted:nil frame:CGRectMake(120, 70, 40, 40)];
    [self.view addSubview:button];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button5];
    
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
