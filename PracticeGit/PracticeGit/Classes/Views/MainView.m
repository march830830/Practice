//
//  MainView.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/3.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "MainView.h"
#import "UIImage+colorImage.h"

@interface MainView ()


@end

@implementation MainView

- (instancetype) initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        self.layOut = [[UICollectionViewFlowLayout alloc] init];
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)) collectionViewLayout:self.layOut];
        self.collectionView.backgroundColor = [UIColor clearColor];
        [self addSubview:self.collectionView];
        
        [self showTitleBarWithBackViewType:0];
        
    }
    return self;
}




- (void) showTableViewWithX:(CGFloat)x Y:(CGFloat)y  {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.tableView.backgroundColor = [UIColor grayColor];
    [self addSubview:self.tableView];
}

- (void) showLogoInView {
    self.logoImageView = [[UIImageView alloc] initWithFrame:self.frame];
    self.logoImageView.image = [UIImage imageNamed:@"nainai"];
    self.logoImageView.userInteractionEnabled = YES;
    [self addSubview:self.logoImageView];
    
    self.leadingLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame) - 75, CGRectGetMinY(self.frame) + 5, 200, 50)];
    self.leadingLabel.text = @"Test Animation";
    self.leadingLabel.font = [UIFont boldSystemFontOfSize:20];
    self.leadingLabel.textColor = [UIColor blackColor];
    [self.logoImageView addSubview:self.leadingLabel];

    self.dragImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetMidX(self.frame), CGRectGetMaxY(self.leadingLabel.frame), 50, 50)];
    self.dragImageView.image = [UIImage imageNamed:@"btn_journey_prev"];
    self.dragImageView.transform = CGAffineTransformMakeRotation(M_PI/2);
    [self.logoImageView addSubview:self.dragImageView];
  
}



//- (void) panGestureAction:(UIGestureRecognizer*)panGesture {
//    
//    CGPoint movePoint = [panGesture locationInView:self];
//    CGRect logoFrame = self.logoImageView.frame;
//    
//    if (panGesture.state == UIGestureRecognizerStateBegan) {
//        self.beginPoint = movePoint;
//        [panGesture.view bringSubviewToFront:self.logoImageView];
//    }
//    else if (panGesture.state == UIGestureRecognizerStateChanged) {
//        CGFloat moveY = movePoint.y - self.beginPoint.y;
//        if (moveY < 0) {
//            logoFrame.origin.y = moveY;
//            self.logoImageView.frame = logoFrame;
////            self.logoImageView.alpha = movePoint.x / CGRectGetWidth([UIScreen mainScreen].bounds);
//
//        }
//    }
//    else if (panGesture.state == UIGestureRecognizerStateEnded) {
//        self.didRemoveLeadingView = YES;
//        [self removeLogoInView];
//    }
//}

- (void) removeLogoInView {
    [UIView animateWithDuration:1 animations:^{
        self.logoImageView.frame = CGRectMake(self.logoImageView.frame.origin.x, self.logoImageView.frame.origin.y - self.logoImageView.frame.size.height , self.logoImageView.frame.size.width, self.logoImageView.frame.size.height);
        self.logoImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.logoImageView removeFromSuperview];
        self.didRemoveLeadingView = YES;
    }];
}

@end
