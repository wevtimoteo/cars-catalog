//
//  CCCarsViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/7/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarsViewController.h"

@interface CCCarsViewController ()

@end

@implementation CCCarsViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setupAppearance];
}

#pragma mark - Setup appearance

- (void)setupAppearance
{
    self.view.backgroundColor = [UIColor whiteColor];
}

@end
