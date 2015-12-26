//
//  UIImage+colorImage.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/18.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "UIImage+colorImage.h"

@implementation UIImage (colorImage)


+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageVerticalGradientWithSize:(CGSize)size colorset:(NSArray*)colors locations:(CGFloat[])locations
{
    UIGraphicsBeginImageContext(size);
    
    // 建立一個 RGB 的顏色空間
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *gradientColors = [NSMutableArray array];;
    for (UIColor *color in colors) {
        if ([color isKindOfClass:[UIColor class]]) {
            [gradientColors addObject:(id)color.CGColor];
        }
    }
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, locations);
    
    // 建立漸層的起點與終點
    CGPoint beginPoint = CGPointMake(size.width / 2, 0);
    CGPoint endPoint = CGPointMake(size.width / 2, size.height);
    
    CGContextDrawLinearGradient(context, gradient, beginPoint, endPoint, 0);
    CGContextSaveGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 結束 context，並且釋放記憶體
    UIGraphicsEndImageContext();
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    return image;
}

+(UIImage *)imageHorizontalGradientWithSize:(CGSize)size colorset:(NSArray *)colors locations:(CGFloat [])locations
{
    UIGraphicsBeginImageContext(size);
    
    // 建立一個 RGB 的顏色空間
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    NSMutableArray *gradientColors = [NSMutableArray array];;
    for (UIColor *color in colors) {
        if ([color isKindOfClass:[UIColor class]]) {
            [gradientColors addObject:(id)color.CGColor];
        }
    }
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (CFArrayRef)gradientColors, locations);
    
    // 建立漸層的起點與終點
    CGPoint beginPoint = CGPointMake(0, size.height / 2);
    CGPoint endPoint = CGPointMake(size.width, size.height / 2);
    
    CGContextDrawLinearGradient(context, gradient, beginPoint, endPoint, 0);
    CGContextSaveGState(context);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    // 結束 context，並且釋放記憶體
    UIGraphicsEndImageContext();
    CGColorSpaceRelease(colorSpace);
    CGGradientRelease(gradient);
    
    return image;
}

+(UIImage *)shadowImage
{
    NSArray *colors = @[[UIColor colorWithWhite:0 alpha:0.4], [UIColor colorWithWhite:0 alpha:0]];
    CGFloat locations[] = {0, 1};
    return [UIImage imageVerticalGradientWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1) colorset:colors locations:locations];
}

@end
