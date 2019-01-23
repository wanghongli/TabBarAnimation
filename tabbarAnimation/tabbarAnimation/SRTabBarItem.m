//
//  SRTabBarItem.m
//  tabbarAnimation
//
//  Created by sunrise on 2019/1/23.
//  Copyright © 2019 Sunrise. All rights reserved.
//

#import "SRTabBarItem.h"
#import <UIColor+BinAdd.h>


@implementation SRTabBarItem

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initUI];
    }
    return self;
}

//- (instancetype)initWithTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage{
//    if (self = [super initWithTitle:title image:image selectedImage:selectedImage]) {
//        [self initUI];
//    }
//    return self;
//}



- (void)initUI{
    NSLog(@"%ld", self.tag);
    NSString *sstt = (self.tag == 3 ? @"#d4b27e" : @"#23d41e");
    self.selectedImage = [self.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.image = [self.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName:  [UIColor colorWithHexString:sstt]} forState:UIControlStateSelected];
    [self setTitleTextAttributes:@{NSForegroundColorAttributeName:  [UIColor colorWithWholeRed:52 green:0 blue:0]} forState:UIControlStateNormal];
    
}
@end
