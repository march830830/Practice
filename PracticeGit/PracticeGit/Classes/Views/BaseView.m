//
//  BaseView.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/20.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "BaseView.h"

@implementation BaseView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor orangeColor];
        
        
    }
    return self;
}

- (void) showTitleBarWithBackViewType:(NSInteger)type {
    if (type  == 0) {
        self.titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.2)];
        self.titleBar.backgroundColor = [UIColor blackColor];
        self.titleBar.alpha = 0.5;
        [self addSubview:self.titleBar];
        
        self.logoView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.25, 0, CGRectGetWidth(self.frame) * 0.51, CGRectGetHeight(self.titleBar.frame))];
        self.logoView.image = [UIImage imageNamed:@"fuck"];
        [self addSubview:self.logoView];
        
        self.logoLabelImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.logoView.frame), 0, CGRectGetWidth(self.logoView.frame), 80)];
        self.logoLabelImage.image = [UIImage imageNamed:@"logoSmall"];
        self.logoLabelImage.alpha = 0.8;
        [self addSubview:self.logoLabelImage];
    }
    else if (type == 1){
        self.titleBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), 60)];
        self.titleBar.backgroundColor = [UIColor blackColor];
        self.titleBar.alpha = 0.5;
        [self addSubview:self.titleBar];
        
        self.logoLabelImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.25, 0, CGRectGetWidth(self.logoView.frame), 60)];
        self.logoLabelImage.image = [UIImage imageNamed:@"logoSmall"];
        self.logoLabelImage.alpha = 0.8;
        [self addSubview:self.logoLabelImage];
        
    }
    
    self.navigationBarButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    [self.navigationBarButton setBackgroundImage:[UIImage imageNamed:@"btn_fot_05pressed"] forState:UIControlStateNormal];
    [self addSubview:self.navigationBarButton];
    
    
    
    self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.85, 0, 50, 50)];
    [self.searchButton setBackgroundImage: [UIImage imageNamed:@"bg_searchbar_right"] forState:UIControlStateNormal];
    [self addSubview:self.searchButton];
    
}

@end
