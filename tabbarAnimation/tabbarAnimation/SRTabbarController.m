//
//  SRTabbarController.m
//  tabbarAnimation
//
//  Created by sunrise on 2019/1/23.
//  Copyright © 2019 Sunrise. All rights reserved.
//

#import "SRTabbarController.h"
#import <Lottie/LOTAnimationView.h>

@interface SRTabbarController () <UITabBarDelegate>

@property(strong, nonatomic) LOTAnimationView *animation;
@property(strong, nonatomic) NSArray *imgParr;
@property(strong, nonatomic) UIImageView *backImg;
@end

@implementation SRTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    _backImg = [[UIImageView alloc] init];
    UIView *tabbarButton = self.tabBar.subviews[0];
    
    _backImg.bounds = CGRectMake(0, 0, tabbarButton.bounds.size.width, tabbarButton.bounds.size.width*68/140.f + 50);
    _backImg.center = CGPointMake(tabbarButton.bounds.size.width/2, tabbarButton.bounds.size.height/2);
    [_backImg setImage:[UIImage imageNamed:@"lottie"]];
    [tabbarButton sendSubviewToBack:_backImg];
    [tabbarButton addSubview:_backImg];
    
    
//    NSLog(@"%@", tabbarButton.subviews);
//    for (UIView *view in tabbarButton.subviews) {
//        if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
//
////            CGFloat scale = [[UIScreen mainScreen] scale];
////            NSString *name = [NSString stringWithFormat:@"%@@%@", self.imgParr[item.tag], scale==3.0?@"3x":@"2x"];
////            LOTAnimationView *animation = [LOTAnimationView animationNamed:name];
//
//            _backImg.bounds = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.width*68/140.f + 50);
//            _backImg.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2);
//            [_backImg setImage:[UIImage imageNamed:@"lottie"]];
//            [view sendSubviewToBack:_backImg];
//            [view addSubview:_backImg];
//
//
////            [animation playWithCompletion:^(BOOL animationFinished) {
////
////            }];
////            self.animation = animation;
////            NSLog(@"%@", name);
//        }
//    }
    
    
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    UIView *tabbarButton = self.tabBar.subviews[item.tag + 1];
    for (UIView *view in tabbarButton.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            [_backImg removeFromSuperview];
            [self.animation removeFromSuperview];
            CGFloat scale = [[UIScreen mainScreen] scale];
            NSString *name = [NSString stringWithFormat:@"%@@%@", self.imgParr[item.tag], scale==3.0?@"3x":@"2x"];
            LOTAnimationView *animation = [LOTAnimationView animationNamed:name];
            [view addSubview:_backImg];
            [view addSubview:animation];
            animation.bounds = CGRectMake(0, 0, view.bounds.size.width, view.bounds.size.width*68/140.f);
            animation.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2);
            [animation playWithCompletion:^(BOOL animationFinished) {
                
            }];
            _backImg.center = CGPointMake(view.bounds.size.width/2, view.bounds.size.height/2);
            
            self.animation = animation;
            NSLog(@"%@", name);
        }
    }
    
}

- (NSArray *)imgParr{
    if (!_imgParr) {
        _imgParr = ({
            NSArray *arr = @[@"tab_poster_rec_p",@"tab_poster_find_p",@"tab_poster_hotpoint_p",@"tab_poster_vip_p"];
            arr;
        });
    }
    return _imgParr;
}
@end
