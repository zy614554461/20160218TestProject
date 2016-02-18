//
//  NSString+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-18.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)
- (CGSize)sizeWithFont:(UIFont *)font maxW:(CGFloat)maxW maxH:(CGFloat)maxH
{
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = font;
    CGSize maxSize = CGSizeMake(maxW, maxH);
    
    
    // 获得系统版本
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;

}

- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithFont:font maxW:MAXFLOAT maxH:MAXFLOAT];
}


//-(NSString *) md5HexDigest
//
//{
//    
//    const char *original_str = [self UTF8String];
//    
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    
//    CC_MD5(original_str, strlen(original_str), result);
//    
//    NSMutableString *hash = [NSMutableString string];
//    
//    for (int i = 0; i < 16; i++)
//        
//        [hash appendFormat:@"%02X", result[i]];
//    
//    return [hash lowercaseString];
//    
//}



@end
