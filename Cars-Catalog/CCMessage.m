//
//  CCMessage.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCMessage.h"
#import <TSMessages/TSMessage.h>

@implementation CCMessage

+ (void)showAlert:(NSString *)message
{
    [self showMessage:message type:TSMessageNotificationTypeWarning];
}

+ (void)showError:(NSString *)message
{
    [self showMessage:message type:TSMessageNotificationTypeError];
}

+ (void)dismissMessage
{
    [TSMessage dismissActiveNotification];
}

#pragma mark - Private

+ (void)showMessage:(NSString *)message type:(TSMessageNotificationType)type
{
    [self dismissMessage];
    [TSMessage showNotificationWithTitle:message subtitle:nil type:type];
}

@end
