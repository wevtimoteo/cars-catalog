//
//  CCCarFormViewController.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/14/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCarRequest.h"
#import "CCUIPickerButton.h"

@interface CCCarFormViewController : UIViewController <CCRequestTarget>

@property (weak, nonatomic) IBOutlet UIScrollView *formScrollView;
@property (strong, nonatomic) IBOutlet UIView *formView;
@property (weak, nonatomic) IBOutlet CCUIPickerButton *yearButton;
@property (weak, nonatomic) IBOutlet UITextField *modelNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *manufacturerTextField;
@property (weak, nonatomic) IBOutlet UITextField *kilometersTextField;
@property (weak, nonatomic) IBOutlet UIButton *addCarButton;

@property (strong, nonatomic) CCCarRequest *carRequest;

@end
