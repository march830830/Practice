//
//  MainController.m
//  PracticeGit
//
//  Created by 陳泓諺 on 2015/12/3.
//  Copyright © 2015年 陳泓諺. All rights reserved.
//

#import "MainController.h"
#import "MainView.h"
#import "MainCell.h"
#import "MainReusableView.h"
#import "ClubInfoController.h"
#import "NavController.h"
#import "UINavigationBar+Awesome.h"

#define NAVBAR_CHANGE_POINT 0

@interface MainController () <UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *adArray;
@property (nonatomic, strong) NSIndexPath *firstIndexpath;
@property (nonatomic, strong) ClubInfoController *clubInfoController;
@property (nonatomic) NSInteger historyY;
@property (nonatomic) NSInteger page;
@property (nonatomic, strong) CAGradientLayer *grandientLayer;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainView = [[MainView alloc] initWithFrame:self.view.frame];
    self.view = self.mainView;
    self.mainView.collectionView.delegate = self;
    self.mainView.collectionView.dataSource = self;
    [self.mainView.collectionView registerClass:[MainCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    [self.mainView.collectionView registerClass:[MainReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView"];

    self.adArray = @[@"nainai",@"nainai2",@"nainai3",@"nainai4",@"nainai5"];


}


- (void) dragAction {
    [self.mainView removeLogoInView];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 5;
}

- (UICollectionViewCell*) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = @"cellIdentifier";
    MainCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    cell.testLabel.text = [NSString stringWithFormat:@"club%ld",(long)indexPath.row];
    cell.testView.image = [UIImage imageNamed:self.adArray[indexPath.row]];
    
    
    return cell;
}

- (void) scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    self.historyY = scrollView.contentOffset.y;

}

- (void) scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
        CGFloat pageWidth = scrollView.frame.size.width;
        self.page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
        UIPageControl *tempPageControl =  (UIPageControl*)[self.mainView.collectionView viewWithTag:100];
        tempPageControl.currentPage = self.page;
    }
    else {
        CGFloat offsetY = scrollView.contentOffset.y;
        if (offsetY > 0) {
            CGFloat alpha =  (64 - offsetY) / 64;
            CGFloat height = 80 * ( (80 - offsetY) / 80 );
                    
//            CGFloat height = self.mainView.logoLabelImage.frame.size.height;
//            height = height * ( (height - offsetY) / height );
            self.mainView.logoLabelImage.frame = (height > 50) ? CGRectMake(self.mainView.logoLabelImage.frame.origin.x, self.mainView.logoLabelImage.frame.origin.y, self.mainView.logoLabelImage.frame.size.width , height) : CGRectMake(self.mainView.logoLabelImage.frame.origin.x, self.mainView.logoLabelImage.frame.origin.y, self.mainView.logoLabelImage.frame.size.width , 50) ;
            NSLog(@"offset = %f\nalpah = %f",offsetY,height);
            self.mainView.logoView.alpha = alpha;
            
            
        } else {
            self.mainView.logoView.alpha = 1;
        }
        
    }
}


- (void) collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {

}

- (void) buttonAction:(UIButton*) button {
//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"https://www.facebook.com/gotcha.nai?fref=ts"]];
    NSLog(@"%ld",(long)button.tag);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {

    CGSize s = CGSizeMake( CGRectGetWidth(self.view.frame)  , CGRectGetHeight(self.view.frame) * 0.266);
    return s;
}

- (CGSize) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    CGSize s = CGSizeMake( CGRectGetWidth(self.view.frame)  , CGRectGetHeight(self.view.frame) * 0.46);
    return s;
}



- (UICollectionReusableView*) collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
        if (kind == UICollectionElementKindSectionHeader) {
            
            MainReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
            if (headerView.subviews.count < 2) {
                [headerView showAdViewWithImageArray:self.adArray];
                headerView.AdScrollView.delegate = self;
                [headerView.pageControl setCurrentPage:self.page];
                for (id object in headerView.AdScrollView.subviews) {
                    if ([[object class] isSubclassOfClass:[UIButton class]]) {
                        [object addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
                    }
                }
            }
            
            return headerView;
        }
    return nil;
}

- (void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.clubInfoController = [[ClubInfoController alloc] init];
    [self.navigationController pushViewController:self.clubInfoController animated:YES];
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
