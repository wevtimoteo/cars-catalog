//
//  CCDetailViewController.h
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/6/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
