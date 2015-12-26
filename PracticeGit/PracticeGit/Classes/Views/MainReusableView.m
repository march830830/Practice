//
//  MainReusableView.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/11.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "MainReusableView.h"

@implementation MainReusableView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void) showAdViewWithImageArray:(NSArray*)imageArray {
    
    self.AdScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.85)];
    self.AdScrollView.backgroundColor = [UIColor clearColor];
    self.AdScrollView.tag = 1;
    [self addSubview:self.AdScrollView];
    
    for (int i = 0; i < imageArray.count; i ++) {
        CGRect frame;
        frame.origin.x = self.AdScrollView.frame.size.width * i;
        frame.origin.y = [[UIScreen mainScreen]bounds].size.height * 0.2;
        frame.size = CGSizeMake(self.AdScrollView.frame.size.width, CGRectGetHeight(self.frame) -  [[UIScreen mainScreen]bounds].size.height * 0.2);
        
        UIButton *imageButton = [[UIButton alloc] initWithFrame:frame];
        [imageButton setBackgroundImage:[UIImage imageNamed:imageArray[i]] forState:UIControlStateNormal];
        imageButton.tag = i;
        imageButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.AdScrollView addSubview:imageButton];
    }
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.AdScrollView.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - CGRectGetHeight(self.AdScrollView.frame))];
    self.pageControl.tag = 100;
    self.pageControl.backgroundColor = [UIColor blackColor];
    [self addSubview:self.pageControl];
    
    [self.AdScrollView setPagingEnabled:YES];
    self.AdScrollView.contentSize = CGSizeMake(self.AdScrollView.frame.size.width * imageArray.count, self.AdScrollView.frame.size.height);
    [self.pageControl setNumberOfPages:imageArray.count];
    
}

@end
