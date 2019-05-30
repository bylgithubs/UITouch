//
//  ViewController.m
//  UITouch
//
//  Created by Civet on 2019/5/21.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImage *image = [UIImage imageNamed:@"8.jpg"];
    UIImageView *iView = [[UIImageView alloc] init];
    iView.image = image;
    iView.frame = CGRectMake(50, 100, 220, 300);
    iView.tag = 101;
    [self.view addSubview:iView];
    
}

//当点击屏幕的开始的瞬间调用此函数
//一次点击的过程
//1 state: 手指触碰屏幕的瞬间
//2 state: 手指接触到屏幕并且没有离开，按住屏幕时吗，包括按住屏幕并且移动手指
//3 state：手指离开屏幕的瞬间
//touchesBegan:在状态1被调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //获取点击对象，anyObject获取任何一个点击对象
    UITouch *touch = [touches anyObject];
    
    //tapCount记录当前点击的次数
    if (touch.tapCount == 1){
        NSLog(@"当次点击");
    }else if(touch.tapCount == 2){
        NSLog(@"双击点击");
    }
    _mPtLast = [touch locationInView:self.view];
    NSLog(@"手指触碰瞬间!");
}

//手指在屏幕上时调用，并且移动数据可以获取
//touchesMoved:在状态2时被调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    //获取当前手指在屏幕上的相对坐标
    //相对于当前视图的坐标
    CGPoint pt = [touch locationInView:self.view];
    NSLog(@"x = %f, y = %f",pt.x, pt.y);
    NSLog(@"手指移动时！");
    
    float xOffset = pt.x - _mPtLast.x;
    float yOffset = pt.y - _mPtLast.y;
    _mPtLast = pt;
    UIImageView *iView = (UIImageView *)[self.view viewWithTag:101];
//    iView.frame = CGRectMake(pt.x, pt.y, iView.frame.size.width, iView.frame.size.height);
    iView.frame = CGRectMake(iView.frame.origin.x+xOffset, iView.frame.origin.y+yOffset, iView.frame.size.width, iView.frame.size.height);
    
    
}
//手指离开屏幕时调用
//touchesEnded:在状态3时调用
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"手指离开屏幕");
}
//在特殊情况下中断屏幕事件时调用
//电话，紧急信息时，取消当前的点击手势作用时调用
//用来做紧急数据处理
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touch cancel!");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
