//
//  CCLFunctionViewController.m
//  SimpleDrawingBoard
//
//  Created by 6666666666666666 on 15/12/10.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import "CCLFunctionViewController.h"
#import "UITableViewCell+CCLPopCell.h"

@interface CCLFunctionViewController ()

@end

@implementation CCLFunctionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置tableview不可滚动
    self.tableView.scrollEnabled =NO;
    
    //初始化模态视图大小
    if ([self respondsToSelector:@selector(setPreferredContentSize:)]) {
        self.preferredContentSize = CGSizeMake(70, 180);
    } else {
        self.contentSizeForViewInPopover = CGSizeMake(100, 1 * 44 - 1);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc ]init];

    switch (indexPath.row) {
        case 0:
            
            cell.textLabel.text = @"相册";
            cell.textLabel.textColor = [UIColor blueColor];
            break;
            
        case 1:
            
            cell.textLabel.text = @"分享";
            cell.textLabel.textColor = [UIColor blueColor];
            break;
            
        case 2:
        {
            cell.textLabel.text = @"网页";
            cell.textLabel.textColor = [UIColor blueColor];
            break;
        }
        case 3:
        {
            cell.textLabel.text = @"保存";
            cell.textLabel.textColor = [UIColor blueColor];
            break;
        }
        default:
            break;
    }
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.delegate CCLPopCell:nil selectedCellAtIndex:indexPath.row];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
