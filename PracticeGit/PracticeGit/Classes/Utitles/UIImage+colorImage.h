//
//  UIImage+colorImage.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/18.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (colorImage)

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (UIImage *)imageVerticalGradientWithSize:(CGSize)size colorset:(NSArray*)colors locations:(CGFloat[])locations;

+ (UIImage *)imageHorizontalGradientWithSize:(CGSize)size colorset:(NSArray*)colors locations:(CGFloat[])locations;

+ (UIImage *)shadowImage;


@end
