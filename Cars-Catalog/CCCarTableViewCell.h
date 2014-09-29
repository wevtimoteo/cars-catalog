//
//  CCCarTableViewCell.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/28/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCCar.h"

@interface CCCarTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *modelNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *manufacturerLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *traveledKilometersLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtLabel;

- (void)configureCar:(CCCar *)car;

@end
