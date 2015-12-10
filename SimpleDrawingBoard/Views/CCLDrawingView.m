//
//  CCLDrawingView.m
//  SimpleDrawingBoard
//
//  Created by 蔡春雷 on 15/10/31.
//  Copyright © 2015年 ccl. All rights reserved.
//

#import "CCLDrawingView.h"
#import "CCLPath.h"

@interface CCLDrawingView ()
//存放所有自建的画笔对象
@property (nonatomic,strong) NSMutableArray *allPaths;
@end
@implementation CCLDrawingView


//数组的懒加载
-(NSMutableArray *)allPaths {
    if (!_allPaths) {
        _allPaths = [NSMutableArray array];
    }
    return _allPaths;
}
//点击屏幕开始
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//获取起始触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
//记录路径起始点
    CCLPath *p = [[CCLPath alloc]init];
    p.setting = [[CCLSetting alloc]init];
    NSLog(@"%@", p.setting);

    p.setting.color = self.setting.color;                // 将VC传过来的setting复制给使用的setting;  ///////////
    
    p.path = [UIBezierPath bezierPath];
   // NSLog(@"%@", p.setting);
    p.path.lineWidth = self.setting.lineWidth;
    [p.path moveToPoint:point];
    
//添加数组
    [self.allPaths addObject:p];
  
    
}
//滑动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //获取移动触摸点
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
//拿出数组中最后添加的路径对象即当前绘图路径 画线
    CCLPath *p = [self.allPaths lastObject];
    [p.path addLineToPoint:point];
    
//画完 要重绘
    [self setNeedsDisplay];
    
}
//滑动结束 抬起手指
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}
// 绘图
- (void)drawRect:(CGRect)rect {
   // [[UIColor redColor] setStroke];
   
    for (CCLPath *p in self.allPaths) {
        [p.setting.color setStroke];
        [p.path stroke];
      //  NSLog(@"%p",p.setting.color);

    }
}


@end
