//
//  BaseView.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/20.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseView : UIView

@property (nonatomic, strong) UIImageView *logoView;
@property (nonatomic, strong) UIImageView *logoLabelImage;
@property (nonatomic, strong) UIButton *navigationBarButton;
@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIView *titleBar;

- (void) showTitleBarWithBackViewType:(NSInteger)type;


@end
