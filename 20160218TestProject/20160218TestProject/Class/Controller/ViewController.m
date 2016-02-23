//
//  ViewController.m
//  20160218TestProject
//
//  Created by 张银 on 16/2/18.
//  Copyright © 2016年 张银. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *redView;
@property (nonatomic,assign)CGFloat previousTransX;
@property (nonatomic,weak)UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.redView.hidden=YES;
    
//    self.redView.center=CGPointMake(120, 120);
    
//    self.redView.center=CGPointMake(120, 120);
    
    self.view.backgroundColor=[UIColor yellowColor];
    
    UIView *blueView=[[UIView alloc]init];
    blueView.backgroundColor=[UIColor blueColor];
    blueView.size=CGSizeMake(50, 50);
    blueView.center=CGPointMake(120, 120);
//    blueView.frame=CGRectMake(150, 150, 120, 120);
    [self.view addSubview:blueView];
    self.blueView=blueView;
    
    
}

-(void)testAnimation{
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyframeAnimation.duration=3.0f;
    
    keyframeAnimation.removedOnCompletion=NO;
    
    keyframeAnimation.fillMode = kCAFillModeForwards;
    
    NSValue *value1=[NSValue valueWithCGPoint:CGPointMake(120, 120)];
    
    NSValue *value2=[NSValue valueWithCGPoint:CGPointMake(150, 120)];
    
    NSValue *value3=[NSValue valueWithCGPoint:CGPointMake(200, 120)];
    
    keyframeAnimation.values=@[value1,value2,value3];
    
    [self.blueView.layer addAnimation:keyframeAnimation forKey:nil];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self testAnimation];
}

/*-(void)panGesture:(UIPanGestureRecognizer *)panGesture{
    
    
    
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            self.previousTransX = self.redView.transform.tx;
            HXLog(@"UIGestureRecognizerStateBegan");
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            
            CGFloat transX = [panGesture translationInView:panGesture.view].x;
            transX+=self.previousTransX;
            HXLog(@"%f",transX);
            CGAffineTransform transT = CGAffineTransformMakeTranslation(transX, 0);
            self.redView.transform=transT;
            
//            HXLog(@"%@",NSStringFromCGRect(self.redView.frame));
            
        }
            break;
        case UIGestureRecognizerStateEnded:
        {

            
            HXLog(@"StateEnded:%f",self.redView.transform.tx);
        }
            break;
            
        default:
            break;
    }
}*/
@end
