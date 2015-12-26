//
//  AppDelegate.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/3.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "AppDelegate.h"
#import "MainController.h"
#import "LeadingPageView.h"
#import "NavController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.mainController = [[MainController alloc] init];
    self.navController = [[NavController alloc] initWithRootViewController:self.mainController];
    self.window.rootViewController = self.navController;
    
//    UIImageView *logoView = [[UIImageView alloc] initWithFrame:CGRectMake(150 , 0, 150, self.navController.navigationBar.frame.size.height)];
//    logoView.image = [UIImage imageNamed:@"logo"];
//    [self.navController.navigationBar addSubview:logoView];
//    
    [self.window makeKeyAndVisible];
    
    [self.navController.navigationBar setBarTintColor:[UIColor clearColor]];
    [self.navController.navigationBar setShadowImage:[UIImage new]];
    return YES;
}

- (void) applicationDidBecomeActive:(UIApplication *)application {
//    self.leadingPageView = [[LeadingPageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
//    [self.window addSubview:self.leadingPageView];
//    [self.leadingPageView showLogoInView];
//    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.leadingPageView removeLeadingPageWithAnimationCompletion:^(BOOL finishes) {
//
//        }];
//        
//    
//    });
    
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
