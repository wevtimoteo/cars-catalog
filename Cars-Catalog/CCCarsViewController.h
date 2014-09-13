//
//  CCCarsViewController.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/7/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCarsRequest.h"

@interface CCCarsViewController : UITableViewController <CCRequestTarget>

@property (strong, nonatomic) CCCarsRequest *carsRequest;

@end
