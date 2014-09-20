//
//  CCAppNavigationController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/20/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCAppNavigationController.h"
#import "CCColorConstants.h"

@implementation CCAppNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupAppearance];
}

#pragma mark - Appearance

- (void)setupAppearance
{
    [self setupBackground];
    [self setupTitle];
}

#pragma mark - Private

- (void)setupBackground
{
    self.navigationBar.tintColor = NavigationBarTintColor;
    [self.navigationBar setBarTintColor:NavigationBarBackgroundColor];
    [self.navigationBar setTranslucent:NO];
}

- (void)setupTitle
{
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

@end
