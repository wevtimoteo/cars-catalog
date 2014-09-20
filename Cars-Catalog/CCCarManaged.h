//
//  CCCarManaged.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/20/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface CCCarManaged : NSManagedObject

@property (retain, nonatomic) NSString *objectId;
@property (retain, nonatomic) NSString *modelName;
@property (retain, nonatomic) NSNumber *year;
@property (retain, nonatomic) NSNumber *traveledKilometers;
@property (retain, nonatomic) NSString *manufacturer;
@property (retain, nonatomic) NSDate *createdAt;
@property (retain, nonatomic) NSDate *updatedAt;

@end
