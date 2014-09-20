//
//  CCCarRepository.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/19/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCCarManaged.h"

@interface CCCarRepository : NSObject

@property (weak, nonatomic) NSManagedObjectContext *managedObjectContext;

+ (CCCarRepository *)buildWithContext:(NSManagedObjectContext *)managedObjectContext;

- (void)saveCars:(NSArray *)cars;
- (void)addCar:(CCCarManaged *)car;
- (NSArray *)retrieveAll;
- (void)cleanUp;
- (NSUInteger)count;

@end
