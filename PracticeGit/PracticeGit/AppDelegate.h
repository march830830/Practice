//
//  AppDelegate.h
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/3.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MainController;
@class LeadingPageView;
@class NavController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) MainController *mainController;
@property (nonatomic, strong) LeadingPageView *leadingPageView;;
@property (nonatomic, strong) NavController *navController;

@end

