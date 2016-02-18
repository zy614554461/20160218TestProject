//
//  NSString+BYExtension.h
//  banyou
//
//  Created by Zimbee on 15/8/25.
//  Copyright (c) 2015年 xiexiangqing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BYExtension)
//十进制转十六进制
+ (NSString *)formatter10jinzhi:(int)number;
//0x21 = 16^1*2+16^0*1
//去除HTML标签(截取字符串)
+(NSString *)clearPLabelWithString:(NSString *)string;
+ (BOOL) isBlankString:(NSString *)string ;
/**
 *  手机号码校验
 *
 *  @param mobileNum 手机号码
 *
 *  @return yes or no
 */
+ (BOOL)validateMobile:(NSString *)mobileNum;
/**
 *  判断运营商yes表示移动，no表示非移动
 *
 *  @param mobileNum 手机号码
 *
 *  @return yes or no
 */
+ (BOOL)validateChinaMobile:(NSString *)mobileNum;

+ (NSString *)removeHTML:(NSString *)html ;
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim;
@end
