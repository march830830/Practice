//
//  NavController.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/13.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "NavController.h"

@interface NavController ()

@property (nonatomic, strong) UIButton *searchButton;
@property (nonatomic, strong) UIBarButtonItem *searchButtonItem;

@end

@implementation NavController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.navigationBar setBarTintColor:[UIColor blackColor]];
    [[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
    NSLog(@"%@",self.viewControllers);
    
    self.searchButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    self.searchButton.backgroundColor = [UIColor cyanColor];
    [self.searchButton addTarget:self action:@selector(searchAction) forControlEvents:UIControlEventTouchUpInside];
    self.searchButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.searchButton];
    self.navigationBarHidden = YES;
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) searchAction {
    NSLog(@"search");
}

- (void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [super pushViewController:viewController animated:animated];
    [viewController.navigationItem setRightBarButtonItem:self.searchButtonItem];
    
}
//
//- (void) setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers {
//    viewControllers[0].navigationController.navigationBarHidden = YES;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
