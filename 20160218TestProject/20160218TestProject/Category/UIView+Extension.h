//
//  UIView+Extension.h
//  banyou
//
//  Created by zhibin on 15-3-16.
//  Copyright (c) 2015年 zhibin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/**
 *  划线
 *
 *  @param rect 划在哪个区域的（划在底部）
 */
+ (void)drawLine:(CGRect)rect InView:(UIView *)sView;
/**
 *  画边框，设置圆角
 */
+ (void)drawBorderInView:(UIView *)sView cornerRadius:(CGFloat)radius masksToBounds:(BOOL)mask borderWidth:(CGFloat)width borderColor:(CGColorRef)colorRef;
+ (void)drawColorLine:(CGRect)rect InView:(UIView *)sView;
/**
 *  UIView的尺寸
 */
@property(nonatomic,assign)CGSize size;

/**
 *  获取或者更改控件的宽度
 */
@property(nonatomic,assign)CGFloat w;

/**
 *  获取或者更改控件的高度
 */
@property(nonatomic,assign)CGFloat h;

/**
 *  获取或者更改控件的x坐标
 */
@property(nonatomic,assign)CGFloat x;

/**
 *  获取或者更改控件的y坐标
 */
@property(nonatomic,assign)CGFloat y;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;

-(UIViewController *)viewController;
@end
