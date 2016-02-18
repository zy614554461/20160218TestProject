//
//  UIImage+Extension.h
//  banyou
//
//  Created by zhibin on 15-3-16.
//  Copyright (c) 2015年 zhibin. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, PlaceHolderImage) {
    PlaceHolderImageBig,    //大图
    PlaceHolderImageSmall   //小图
};
@interface UIImage (Extension)


+(instancetype)imageWithName:(NSString *)imgName;


/**
 *  自动从中间拉伸图片
 *
 *  @param imgName 图片名称
 */
+(instancetype)resizeImgWithName:(NSString *)imgName;

+ (instancetype)imageWithStretchableName:(NSString *)imageName;
+ (instancetype)imageWithOriginalName:(NSString *)imageName;
/**
 *  通过颜色来生成一个纯色图片
 *
 *  @param color 颜色
 *  @param rect  尺寸
 *
 *  @return 图片
 */
+ (UIImage *)buttonImageFromColor:(UIColor *)color rect:(CGRect)rect;
- (UIImage*) circleImage:(UIImage*) image withParam:(CGFloat) inset;
+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;
- (UIImage *)clipImageInRect:(CGRect)rect;
- (UIImage*)imageByScalingAndCroppingForSize:(CGSize)targetSize;
+ (instancetype)waterImageWithlogo:(PlaceHolderImage)placeHolderImage bgRect:(CGRect)rect;
@end
