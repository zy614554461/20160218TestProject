//
//  NSString+BYExtension.m
//  banyou
//
//  Created by Zimbee on 15/8/25.
//  Copyright (c) 2015年 xiexiangqing. All rights reserved.
//

#import "NSString+BYExtension.h"

@implementation NSString (BYExtension)
//十进制转十六进制
+ (NSString *)formatter10jinzhi:(int)number{
    NSString *jinzhi16char = @"0123456789abcdef";
    NSInteger int10 = number;
    NSString *jinzhi16 = @"";
    int j = 0;
    while(int10 != 0)
    {
        j = int10 % 16;
        //        NSLog(@"%i", j);
        //        NSLog(@"%@", [jinzhi16char substringWithRange:NSMakeRange(j,1)]);
        jinzhi16 = [NSString stringWithFormat:@"%@%@",[jinzhi16char substringWithRange:NSMakeRange(j,1)], jinzhi16];
        int10 = int10 / 16;
    }
    jinzhi16 = [NSString stringWithFormat:@"%@%@",@"0x", jinzhi16];
    return jinzhi16;
}
//0x21 = 16^1*2+16^0*1
//去除HTML标签(截取字符串)
+(NSString *)clearPLabelWithString:(NSString *)string{
    NSRange rangePre=[string rangeOfString:@"<p>"];
    NSRange rangeExt = [string rangeOfString:@"</p>"];
    NSRange rangeMake=NSMakeRange(rangePre.location+rangePre.length, rangeExt.location);
    return [string substringWithRange:rangeMake];
}
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    } if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    } if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    } return NO;
}

/**
 *  手机号码校验
 *
 *  @param mobileNum 手机号码
 *
 *  @return yes or no
 */
+ (BOOL)validateMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
/**
 *  判断运营商yes表示移动，no表示非移动
 *
 *  @param mobileNum 手机号码
 *
 *  @return yes or no
 */
+ (BOOL)validateChinaMobile:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
//    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
//    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES))
    {
        return YES;
    }
    else
    {
        return NO;
    }
}
+ (NSString *)removeHTML:(NSString *)html {
    
    NSScanner *theScanner;
    
    NSString *text = nil;
    
    theScanner = [NSScanner scannerWithString:html];
    
    
    
    while ([theScanner isAtEnd] == NO) {
        
        // find start of tag
        
        [theScanner scanUpToString:@"<" intoString:NULL] ;
        
        
        
        // find end of tag
        
        [theScanner scanUpToString:@">" intoString:&text] ;
        
        
        
        // replace the found tag with a space
        
        //(you can filter multi-spaces out later if you wish)
        
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>", text] withString:@" "];
        
        
        
    }
    
    return html;
    
}
+ (NSString *)flattenHTML:(NSString *)html trimWhiteSpace:(BOOL)trim{
    NSScanner *theScanner = [NSScanner scannerWithString:html];
    NSString *text=nil;
    while ([theScanner isAtEnd]==NO) {
        [theScanner scanUpToString:@"<" intoString:NULL];
        [theScanner scanUpToString:@">" intoString:&text];
        html=[html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
    }
    return trim?[html stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]:html;
}

@end
