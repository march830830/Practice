//
//  MainController.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/3.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainView;

@interface MainController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) MainView *mainView;

@end
