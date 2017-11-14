//
//  UIColor+MTTCategory.h
//  Moodv2
//
//  Created by 刘浩 on 2017/8/2.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (MTTCategory)

+ (UIColor *)mtt_colorFromHexString:(NSString *)hexString ;

+ (UIColor *) mtt_randomColor;

+ (UIColor *)mtt_colorWithHex:(int)hexValue;

+ (UIColor *)mtt_colorWithHex:(int)hexValue alpha:(CGFloat)alpha;


+ (UIColor *) mtt_colorRGB:(CGFloat)R g:(CGFloat)G b:(CGFloat)B;

+ (UIColor *) mtt_colorRGBA:(CGFloat)R g:(CGFloat)G b:(CGFloat)B A:(CGFloat)alpha;

+ (UIColor*)mtt_colorFromImage:(UIImage *)image fillInView:(UIView *)view ;
@end
