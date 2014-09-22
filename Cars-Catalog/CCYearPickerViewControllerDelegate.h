//
//  CCYearPickerViewControllerDelegate.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/16/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPickerViewController.h"
#import "CCRequiredPickerButtonDelegate.h"

@interface CCYearPickerViewControllerDelegate : CCRequiredPickerButtonDelegate <CCPickerViewControllerDelegate>

- (void)loadYearOptions;
- (NSString *)selectedOptionTitle;

@end
