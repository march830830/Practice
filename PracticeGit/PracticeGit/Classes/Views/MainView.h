//
//  MainView.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/3.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"


@interface MainView : BaseView


@property (nonatomic, strong) UIView *leadingView;
@property (nonatomic, strong) UILabel *leadingLabel;

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layOut;

@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIImageView *dragImageView;
@property (nonatomic) CGPoint beginPoint;
@property (nonatomic) BOOL didRemoveLeadingView;
@property (nonatomic, strong) UIScrollView *baseScrollView;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIImageView *titleImage;

- (void) showLogoInView;
- (void) removeLogoInView;
- (void) showTableViewWithX:(CGFloat)x Y:(CGFloat)y ;
@end
