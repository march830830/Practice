//
//  MainCell.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/9.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "MainCell.h"

@implementation MainCell

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor yellowColor];
        
        self.testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 200, 40)];
        self.testLabel.textColor = [UIColor blackColor];
        [self addSubview:self.testLabel];
        
        self.testView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        self.testView.backgroundColor = [UIColor purpleColor];
        self.testView.contentMode = UIViewContentModeScaleAspectFit;
        [self addSubview:self.testView];
        
        UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        [visualEffectView setFrame:CGRectMake(0, CGRectGetHeight(self.frame) - 50, CGRectGetWidth(self.frame), 50)];
        [self addSubview:visualEffectView];

        
    }
    return self;
}



@end
