//
//  CCCar.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/12/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CCCar : NSObject

@property (strong, nonatomic) NSString *objectId;
@property (strong, nonatomic) NSString *modelName;
@property (assign, nonatomic) NSInteger year;
@property (assign, nonatomic) NSInteger traveledKilometers;
@property (strong, nonatomic) NSString *manufacturer;
@property (strong, nonatomic) NSDate *createdAt;
@property (strong, nonatomic) NSDate *updatedAt;

- (id)initFromDictionary:(NSDictionary *)data;
- (NSDictionary *)toDictionary;

@end
