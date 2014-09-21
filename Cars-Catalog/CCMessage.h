//
//  CCMessage.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/21/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CCMessage : NSObject

- (void)showAlert:(NSString *)message;
- (void)showError:(NSString *)message;

@end
