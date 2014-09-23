//
//  CCCarsViewController.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/7/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCarsRequest.h"
#import "CCCarRepository.h"

@interface CCCarsViewController : UITableViewController <CCRequestTarget>

+ (CCCarsViewController *)buildWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
- (void)goToAddCar;

@property (strong, nonatomic) CCCarsRequest *carsRequest;
@property (weak, atomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) CCCarRepository *carRepository;

@end
