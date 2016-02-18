//
//  UIView+Extension.m
//  banyou
//
//  Created by zhibin on 15-3-16.
//  Copyright (c) 2015年 zhibin. All rights reserved.
//

#import "UIView+Extension.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@implementation UIView (Extension)
/**
 *  划线
 *
 *  @param rect 划在哪个区域的（划在底部）
 */
+ (void)drawLine:(CGRect)rect InView:(UIView *)sView{
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:rect];
    [sView addSubview:imageView];
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0);
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 1.0, 0.0, 0.0, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 10, sView.bounds.size.height-2);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), ScreenWidth-20, sView.bounds.size.height-2);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}
+ (void)drawColorLine:(CGRect)rect InView:(UIView *)sView{
    UIImageView * imageView=[[UIImageView alloc] initWithFrame:rect];
    [sView addSubview:imageView];
    UIGraphicsBeginImageContext(imageView.frame.size);
    [imageView.image drawInRect:CGRectMake(0, 0, imageView.frame.size.width, imageView.frame.size.height)];
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 0.5);
    CGContextSetAllowsAntialiasing(UIGraphicsGetCurrentContext(), YES);
    
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), 38.0/255, 38.0/255, 38.0/255, 1.0);
    CGContextBeginPath(UIGraphicsGetCurrentContext());
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), 0, sView.bounds.size.height-1.7);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), ScreenWidth, sView.bounds.size.height-1.7);
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    imageView.image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}

+ (void)drawBorderInView:(UIView *)sView cornerRadius:(CGFloat)radius masksToBounds:(BOOL)mask borderWidth:(CGFloat)width borderColor:(CGColorRef)colorRef{
    sView.layer.cornerRadius=radius;
    sView.layer.masksToBounds=mask;
    sView.layer.borderWidth=width;
    sView.layer.borderColor=colorRef;
}
-(void)setSize:(CGSize)size{
    self.bounds = CGRectMake(0, 0, size.width, size.height);
}

-(CGSize)size{
    return self.bounds.size;
}

-(void)setW:(CGFloat)w{
    CGRect frm = self.frame;
    frm.size.width = w;
    self.frame = frm;
}

-(CGFloat)w{
    return self.size.width;
}

-(void)setH:(CGFloat)h{
    CGRect frm = self.frame;
    frm.size.height = h;
    self.frame = frm;
}

-(CGFloat)h{
    return self.size.height;
}

-(void)setX:(CGFloat)x{
    CGRect frm = self.frame;
    frm.origin.x = x;
    
    self.frame = frm;
}
-(CGFloat)x{
    return self.frame.origin.x;
}

-(void)setY:(CGFloat)y{
    CGRect frm = self.frame;
    frm.origin.y = y;
    
    self.frame = frm;
    
}

-(CGFloat)y{
    return self.frame.origin.y;
}

- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)centerX
{
    return self.center.x;
}

- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
- (CGFloat)centerY
{
    return self.center.y;
}

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}
@end
