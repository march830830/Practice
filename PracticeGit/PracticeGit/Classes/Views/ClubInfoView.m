//
//  ClubInfoView.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/13.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "ClubInfoView.h"

@implementation ClubInfoView

- (instancetype) initWithFrame:(CGRect)frame imageArray:(NSArray*)imageArray {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self showTitleBarWithBackViewType:1];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.titleBar.frame), CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.28)];
        self.scrollView.backgroundColor = [UIColor clearColor];
        self.scrollView.tag = 1;
        self.scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:self.scrollView];
        
        for (int i = 0; i < imageArray.count; i ++) {
            CGRect frame;
            frame.origin.x = self.scrollView.frame.size.width * i;
            frame.origin.y = 0;
            frame.size = CGSizeMake(self.scrollView.frame.size.width, CGRectGetHeight(self.scrollView.frame));
            
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
            imageView.image = [UIImage imageNamed:imageArray[i]];
            imageView.tag = i;
            imageView.userInteractionEnabled = NO;
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.scrollView addSubview:imageView];
        }
        [self.scrollView setPagingEnabled:YES];
        self.scrollView.backgroundColor = [UIColor darkGrayColor];
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * imageArray.count, self.scrollView.frame.size.height);

        self.backgroundColor = [UIColor blueColor];
        
//        [self setOrderView];
//        [self setDesView];
//        [self setDiscountView];
        
    }
    return self;
}

- (void) showPageButtonWithFrame:(CGRect)frame titles:(NSArray*)titles {
    if (!self.buttons) {
        self.buttons = [NSMutableArray array];
        CGFloat widthAvg = CGRectGetWidth(frame) / titles.count;
        int i = 0;
        
        for (NSString *title in titles) {
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(widthAvg * i, CGRectGetMaxY(self.scrollView.frame), widthAvg, CGRectGetHeight(frame) - 5)];
            button.tag = i;
            [button setTitle:title forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
            button.backgroundColor = [UIColor lightGrayColor];
            [self addSubview:button];
            if (i == 0) {
                button.selected = YES;
            }
            [self.buttons addObject:button];
            i++;
        }
        
    }

}



- (void) setOrderView {
    self.orderView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) * 0.5, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.5)];
    self.orderView.backgroundColor = [UIColor brownColor];
    self.orderView.tag = 0;
    [self addSubview:self.orderView];
}

- (void) setDesView {
    self.desView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) * 0.5, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.5)];
    self.desView.backgroundColor = [UIColor grayColor];
    self.desView.tag = 1;
    [self addSubview:self.desView];
}

- (void) setDiscountView {
    self.discountView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) * 0.5, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.5)];
    self.discountView.backgroundColor = [UIColor yellowColor];
    self.discountView.tag = 0;
    [self addSubview:self.discountView];
}



@end
