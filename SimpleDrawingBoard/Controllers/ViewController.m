//
//  ViewController.m
//  SimpleDrawingBoard
//
//  Created by 蔡春雷 on 15/10/31.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import "ViewController.h"
#import "CCLSetting.h"
#import "CCLDrawingView.h"
#import <Foundation/Foundation.h>
#import "CCLPaintbrushViewController.h"
#import "WEPopoverController.h"
#import "CCLBackgroundViewController.h"
#import "CCLFunctionViewController.h"
#import "UITableViewCell+CCLPopCell.h"
#import "CCLChooseColorViewController.h"


@interface ViewController ()<WEPopoverControllerDelegate, CCLPopCellDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UISegmentedControl *colerSegmented;
@property (weak, nonatomic) IBOutlet UIButton *ruberButtton;
@property (weak, nonatomic) IBOutlet UIStepper *lineStepper;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (strong, nonatomic) IBOutlet CCLDrawingView *drawingView;  // 使用storyBoard上的view的引用 要连线
//用于传值
@property (nonatomic, strong) CCLSetting *setting;

@property (weak, nonatomic) IBOutlet UIView *paintToolView;
@property (weak, nonatomic) IBOutlet UIButton *paintbrushBtn;
@property (weak, nonatomic) IBOutlet UIButton *chooseColorBtn;
@property (weak, nonatomic) IBOutlet UIButton *backgroundBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *functionBarButtonItem;
@property (nonatomic, strong) WEPopoverController *popoverController;
@end
@implementation ViewController
//对setting的懒加载
-(CCLSetting *)setting {
    if (!_setting) {
        _setting = [[CCLSetting alloc]init];
    }
    return _setting;
}
//VC属性的初始化
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.ruberButtton.selected = YES;
    }
    return self;
}

//推出画笔选择窗口
- (IBAction)paintbrushBtnclick:(id)sender {
    CCLPaintbrushViewController *paintbrushVC = [CCLPaintbrushViewController new];
    
    [self presentPOPViewWithViewController:paintbrushVC andControl:sender];
    
    //[self presentViewController:paintbrushVC animated:YES completion:nil];
}
- (IBAction)backguoundBtnClick:(id)sender {
    CCLBackgroundViewController *VC = [CCLBackgroundViewController new];
    
    [self presentPOPViewWithViewController:VC andControl:sender];
}
- (IBAction)chooseColorBtnClick:(id)sender {
    CCLChooseColorViewController *colorVC = [[CCLChooseColorViewController alloc]initWithColor:[UIColor blueColor] fullColor:YES];
    [self presentPOPViewWithViewController:colorVC andControl:self.chooseColorBtn];
}
- (IBAction)functionBarBtnitem:(id)sender {
    CCLFunctionViewController *VC = [CCLFunctionViewController new];
    VC.delegate = self;
    self.popoverController = [[WEPopoverController alloc] initWithContentViewController:VC];
    self.popoverController.delegate = self;
   // CGRect rect = self.functionBarButtonItem.frame;
   // rect.origin.y = self.paintToolView.frame.origin.y;
    [self.popoverController presentPopoverFromBarButtonItem:self.functionBarButtonItem
                                   permittedArrowDirections:UIPopoverArrowDirectionDown
                                                   animated:YES];
}
/// 推出模态视图
- (void)presentPOPViewWithViewController:(id )viewController andControl:(UIButton *)btn {

    self.popoverController = [[WEPopoverController alloc] initWithContentViewController:viewController];
    self.popoverController.delegate = self;
    CGRect rect = btn.frame;
    rect.origin.y = self.paintToolView.frame.origin.y;
    [self.popoverController presentPopoverFromRect:rect
                                            inView:self.view
                          permittedArrowDirections:UIPopoverArrowDirectionDown
                                          animated:YES];
}

#pragma mark ---CCLPopCellDelegate
- (void)CCLPopCell:(UITableViewCell *)cell selectedCellAtIndex:(NSInteger)cellIndex {
    switch (cellIndex) {
        case 0:
        {
            UIImagePickerController *pc = [[UIImagePickerController alloc]init];
            pc.allowsEditing = YES;
            pc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            pc.delegate = self;
            [self presentViewController:pc animated:YES completion:nil];
            break;
        }
        default:
            break;
    }
}
#pragma mark --- UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    UIImage *image = info[UIImagePickerControllerEditedImage];
    //self.headImageView.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - WEPopoverControllerDelegate

- (void)popoverControllerDidDismissPopover:(WEPopoverController *)popoverController {
    self.popoverController = nil;
    //[self updateButtonTitle];
}
- (IBAction)changeColorSC:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.setting.color = [UIColor redColor];
           
            break;
        case 1:
            self.setting.color = [UIColor greenColor];
           
            break;
        case 2:
            self.setting.color = [UIColor blueColor];
          
            break;
        default:
            break;
    }
}
- (IBAction)changeLineWidthSTP:(UIStepper *)sender {
    self.setting.lineWidth = sender.value;
    self.lineLabel.text = [@"线宽: " stringByAppendingString:@(sender.value).stringValue];
}
- (IBAction)rubberButton:(UIButton *)sender {
//按钮点击事件
    [sender addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)buttonClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        self.colerSegmented.enabled = NO;
        self.setting.color = [UIColor whiteColor];
    }else{
        self.setting.isRubber = NO;
        self.colerSegmented.enabled = YES;
        [self changeColorSC:self.colerSegmented];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self changeColorSC:self.colerSegmented];
    [self changeLineWidthSTP:self.lineStepper];
    
    self.drawingView.setting= self.setting;
    
     [self.navigationController  setToolbarHidden:NO animated:YES];
   // NSLog(@"%@", self.setting);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
