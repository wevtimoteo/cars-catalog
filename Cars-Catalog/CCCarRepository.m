//
//  CCCarRepository.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/19/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarRepository.h"
#import "CCEntityNames.h"

@implementation CCCarRepository

+ (CCCarRepository *)buildWithContext:(NSManagedObjectContext *)managedObjectContext
{
    CCCarRepository *carRepository = [[CCCarRepository alloc] init];
    carRepository.managedObjectContext = managedObjectContext;

    return carRepository;
}

- (void)addCar:(CCCarManaged *)car
{
    [NSEntityDescription insertNewObjectForEntityForName:CAR_ENTITY inManagedObjectContext:self.managedObjectContext];

    [self.managedObjectContext save:nil];
}

- (NSArray *)retrieveAll
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:CAR_ENTITY];

    return [self.managedObjectContext executeFetchRequest:fetchRequest error:nil];
}

- (void)cleanUp
{
    NSArray *cars = [self.managedObjectContext executeFetchRequest:[self fetchRequest] error:nil];
    
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
