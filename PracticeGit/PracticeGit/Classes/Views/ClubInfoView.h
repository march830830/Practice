//
//  ClubInfoView.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/13.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"




@interface ClubInfoView : BaseView

@property(nonatomic, strong) NSMutableArray *buttons;
@property(nonatomic, strong) UIScrollView *scrollView;
@property(nonatomic, strong) UIView *orderView;
@property(nonatomic, strong) UIView *desView;
@property(nonatomic, strong) UIView *discountView;



- (void) showPageButtonWithFrame:(CGRect)frame titles:(NSArray*)titles;
- (instancetype) initWithFrame:(CGRect)frame imageArray:(NSArray*)imageArray;

@end

