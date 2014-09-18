//
//  CCPickerViewControllerDelegate.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/15/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CCPickerViewController;

@protocol CCPickerViewControllerDelegate <NSObject, UIPickerViewDataSource, UIPickerViewDelegate>

- (NSString *)selectedOptionTitle;
- (void)donePickerViewController:(CCPickerViewController *)pickerViewController;
- (void)cancelledPickerViewController:(CCPickerViewController *)pickerViewController;
- (void)selectOptionWithTitle:(NSString *)title;
- (NSInteger)selectedRowForComponent:(NSInteger)component;
- (void)setPickerViewController:(CCPickerViewController *)pickerViewController;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component;

@end
