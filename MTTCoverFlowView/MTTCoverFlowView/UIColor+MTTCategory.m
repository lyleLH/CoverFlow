//
//  UIColor+MTTCategory.m
//  Moodv2
//
//  Created by 刘浩 on 2017/8/2.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "UIColor+MTTCategory.h"


@implementation UIColor (MTTCategory)

+ (UIColor *)mtt_colorFromHexString:(NSString *)hexString {
    unsigned rgbValue = 0;
    NSScanner *scanner = [NSScanner scannerWithString:hexString];
    [scanner setScanLocation:1]; // bypass '#' character
    [scanner scanHexInt:&rgbValue];
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16)/255.0 green:((rgbValue & 0xFF00) >> 8)/255.0 blue:(rgbValue & 0xFF)/255.0 alpha:1.0];
}


+ (UIColor *) mtt_randomColor

{
    
    CGFloat hue = ( arc4random() % 256 / 256.0 ); //0.0 to 1.0
    
    CGFloat saturation = ( arc4random() % 128 / 256.0 ) + 0.2; // 0.5 to 1.0,away from white
    
    CGFloat brightness = ( arc4random() % 128 / 256.0 ) + 0.4; //0.5 to 1.0,away from black
    
    return [UIColor colorWithHue:hue saturation:saturation brightness:brightness alpha:1];
    
}


#pragma mark - Hex

+ (UIColor *)mtt_colorWithHex:(int)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)mtt_colorWithHex:(int)hexValue {
    return [UIColor mtt_colorWithHex:hexValue alpha:1.0];
}


#pragma mark - RGBA
+(UIColor *) mtt_colorRGB:(CGFloat)R g:(CGFloat)G b:(CGFloat)B {
    
    return [self mtt_colorRGBA:R g:G b:B A:1.0];
}

+(UIColor *) mtt_colorRGBA:(CGFloat)R g:(CGFloat)G b:(CGFloat)B A:(CGFloat)alpha {
    return [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:alpha];
    
}



+ (UIColor*)mtt_colorFromImage:(UIImage *)imageIn fillInView:(UIView *)view {
    
    UIGraphicsBeginImageContext(view.frame.size);
    [imageIn drawInRect:view.bounds];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  [UIColor colorWithPatternImage:image];
    
}
@end
