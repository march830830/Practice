//
//  ClubInfoController.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/13.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "ClubInfoController.h"
#import "ClubInfoView.h"


@interface ClubInfoController () 

@property (nonatomic) NSInteger type;
@property (nonatomic, strong) NSDictionary *colorDic;
@property (nonatomic, strong) NSArray *imageArray;

@end

@implementation ClubInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"asd";
    self.imageArray = @[@"francis",@"francis2",@"francis3",@"francis5",@"francis6"];
    
    self.clubInfoView = [[ClubInfoView alloc] initWithFrame:self.view.frame imageArray:self.imageArray];
    self.view = self.clubInfoView;
    [self.clubInfoView showPageButtonWithFrame:CGRectMake(0, 64, CGRectGetWidth(self.view.frame) , 50)
                                        titles:@[@"訂資訊",@"簡介",@"優惠"]];

    for (id object in self.view.subviews) {
        if ([[object class] isSubclassOfClass:[UIButton class]]) {
            [object addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    
    self.colorDic = @{@"0":[UIColor blueColor],@"1":[UIColor greenColor],@"2":[UIColor purpleColor]};


    
    
    
}

- (void)buttonAction:(UIButton*)button {
    for (UIButton *btn in self.clubInfoView.buttons) {
        btn.selected = NO;
    }
    button.selected = YES;
//    [self.clubInfoView viewWithTag:button.tag].layer.zPosition = 1;

    self.clubInfoView.backgroundColor = self.colorDic[[NSString stringWithFormat:@"%ld",(long)button.tag]];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
