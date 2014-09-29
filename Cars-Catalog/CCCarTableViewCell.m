//
//  CCCarTableViewCell.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/28/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarTableViewCell.h"

@implementation CCCarTableViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];

    [self setupAppearance];
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupAppearance];
    }
    return self;
}

- (void)configureCar:(CCCar *)car
{
    self.modelNameLabel.text = car.modelName;
    self.manufacturerLabel.text = car.manufacturer;
    self.yearLabel.text = [NSString stringWithFormat:@"%li", (long)car.year];
    self.traveledKilometersLabel.text = [NSString stringWithFormat:@"%li km", (long)car.traveledKilometers];
    self.createdAtLabel.text = [NSString stringWithFormat:@"%@", car.createdAt];
}

#pragma mark - Setup appearance

- (void)setupAppearance
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor clearColor];
}

@end
