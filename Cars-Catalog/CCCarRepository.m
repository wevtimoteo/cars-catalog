//
//  CCCarRepository.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/19/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarRepository.h"

@implementation CCCarRepository

static NSString *const CarEntityName = @"CCCar";

+ (CCCarRepository *)buildWithContext:(NSManagedObjectContext *)managedObjectContext
{
    CCCarRepository *carRepository = [[CCCarRepository alloc] init];
    carRepository.managedObjectContext = managedObjectContext;

    return carRepository;
}

- (void)addCar:(CCCar *)car
{
    [NSEntityDescription insertNewObjectForEntityForName:CarEntityName inManagedObjectContext:self.managedObjectContext];

    [self.managedObjectContext save:nil];
}

- (NSArray *)retrieveAll
{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:CarEntityName];
    
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
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:CarEntityName];
    [fetchRequest setResultType:NSDictionaryResultType];

    return fetchRequest;
}

@end
