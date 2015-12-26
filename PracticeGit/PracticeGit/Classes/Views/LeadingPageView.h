//
//  LeadingPageView.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/16.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeadingPageView : UIView

@property (nonatomic, strong) UILabel *leadingLabel;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIImageView *dragImageView;
@property (nonatomic, strong) UIView *backView;

- (void) showLogoInView;
- (void) removeLeadingPageWithAnimationCompletion:(void(^)(BOOL finishes))completion;

@end
