//
//  LeadingPageView.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/16.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "LeadingPageView.h"

@implementation LeadingPageView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

- (void) showLogoInView {
    self.backView = [[UIView alloc] initWithFrame:self.frame];
    self.backView.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.backView];

    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.frame) * 0.3,CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) * 0.3)];
    self.logoImageView.image = [UIImage imageNamed:@"nainai"];
    self.logoImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.logoImageView.userInteractionEnabled = YES;
    [self addSubview:self.logoImageView];
    
    self.leadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - 75, CGRectGetHeight(self.frame) * 0.45, 200, 50)];
    self.leadingLabel.text = @"Test Animation";
    self.leadingLabel.font = [UIFont boldSystemFontOfSize:20];
    self.leadingLabel.textColor = [UIColor blackColor];
    [self addSubview:self.leadingLabel];
    
    self.dragImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.frame) * 0.45, CGRectGetMaxY(self.leadingLabel.frame), 50, 50)];
    self.dragImageView.image = [UIImage imageNamed:@"btn_journey_prev"];
    self.dragImageView.transform = CGAffineTransformMakeRotation((M_PI / 2) * 3);
    [self addSubview:self.dragImageView];
    
    
    
}

- (void) removeLeadingPageWithAnimationCompletion:(void(^)(BOOL finishes))completion {
    [UIView animateWithDuration:1 animations:^{
        CGRect arrorFrame = self.dragImageView.frame;
        CGRect titleLabelFrame = self.leadingLabel.frame;
        CGRect logoFrame = self.logoImageView.frame;
        
        arrorFrame.origin.y = CGRectGetMaxY(self.frame);
        titleLabelFrame.origin.y = CGRectGetMinY(self.frame) + 5;
        logoFrame = CGRectMake(CGRectGetWidth(self.frame) * 0.33, 0, CGRectGetWidth(self.frame) * 0.4, CGRectGetHeight(self.frame) * 0.1);
        
        self.dragImageView.frame = arrorFrame;
        self.leadingLabel.frame = titleLabelFrame;
        self.logoImageView.frame = logoFrame;
        
        self.backView = 0;
        
    } completion:^(BOOL finished) {
        self.alpha = 0;
    }];
}
@end
