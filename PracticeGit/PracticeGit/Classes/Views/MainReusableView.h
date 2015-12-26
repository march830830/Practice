//
//  MainReusableView.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/11.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainReusableView : UICollectionReusableView

@property (nonatomic, strong) UIScrollView *AdScrollView;
@property (nonatomic, strong) UIPageControl *pageControl;
//@property (nonatomic, strong) UIButton *imageButton;

- (void) showAdViewWithImageArray:(NSArray*)imageArray;

@end
