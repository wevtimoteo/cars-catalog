//
//  CCCarRepository.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/19/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarRepository.h"
#import "CCEntityNames.h"
#import "CCCar.h"

@implementation CCCarRepository

+ (CCCarRepository *)buildWithContext:(NSManagedObjectContext *)managedObjectContext
{
    CCCarRepository *carRepository = [[CCCarRepository alloc] init];
    carRepository.managedObjectContext = managedObjectContext;

    return carRepository;
}

- (void)saveCars:(NSArray *)cars
{
    [self cleanUp];

    for (id car in cars) {
        [self addCar:car];
    }
}

- (void)addCar:(CCCar *)car
{
    CCCarManaged *carManaged = [NSEntityDescription insertNewObjectForEntityForName:CAR_ENTITY inManagedObjectContext:self.managedObjectContext];

    carManaged.objectId = car.objectId;
    carManaged.modelName = car.modelName;
    carManaged.manufacturer = car.manufacturer;
    carManaged.year = [NSNumber numberWithInteger:car.year];
    carManaged.traveledKilometers = [NSNumber numberWithInteger:car.traveledKilometers];
    carManaged.createdAt = car.createdAt;
    carManaged.updatedAt = car.updatedAt;

    [self.managedObjectContext save:nil];
}

- (NSArray *)retrieveAll
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:CAR_ENTITY];

    return [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
}

- (void)cleanUp
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:CAR_ENTITY];
    NSArray *cars = [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
    
    for (id car in cars) {
        [self.managedObjectContext deleteObject:car];
    }

    [self.managedObjectContext save:nil];
}

- (NSUInteger)count
{
    return [self.managedObjectContext countForFetchRequest:[self fetchRequest] error:nil];
}

#pragma mark - Private

- (NSFetchRequest *)fetchRequest
{
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:CAR_ENTITY];
    [fetchRequest setResultType:NSDictionaryResultType];

    return fetchRequest;
}

@end
