//
//  CCPickerViewController.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCPickerViewControllerDelegate.h"

@interface CCPickerViewController : UIViewController

@property (weak, atomic) UIButton *pickerButton;
@property (weak, atomic) id<CCPickerViewControllerDelegate> delegate;
@property (weak, atomic) UIViewController *parent;

- (id)initWithPickerButton:(UIButton *)pickerButton parent:(UIViewController *)parent delegate:(id<CCPickerViewControllerDelegate>)delegate;
- (void)selectOptionWithTitle:(NSString *)title;
- (void)pick;

- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end
