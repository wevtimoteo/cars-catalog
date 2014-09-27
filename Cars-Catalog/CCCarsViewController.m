//
//  CCCarsViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/7/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarsViewController.h"
#import "CCCarFormViewController.h"
#import "CCColorConstants.h"
#import "Cars_Catalog-Swift.h"

@implementation CCCarsViewController

static NSString *const CellIdentifier = @"CarCell";

+ (CCCarsViewController *)buildWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    CCCarsViewController *carsViewController = [[CCCarsViewController alloc] init];
    carsViewController.carsRequest = [CCCarsRequest buildWithRequestTarget:carsViewController];
    carsViewController.managedObjectContext = managedObjectContext;
    carsViewController.carRepository = [CCCarRepository buildWithContext:carsViewController.managedObjectContext];

    return carsViewController;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupRefreshControl];
    [self setupAppearance];
    [self setupNavigationItems];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    [self handleRefresh];
}

#pragma mark - Refresh control

- (void)handleRefresh
{
    [self.refreshControl beginRefreshing];
    [self.carsRequest refresh];
}

- (void)setupRefreshControl
{
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(handleRefresh) forControlEvents:UIControlEventValueChanged];
    [self setRefreshControl:refreshControl];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    if ([self.refreshControl isRefreshing]) {
        [self handleRefresh];
    }
}

#pragma mark - Fetch data

- (void)dataRefreshed:(CCResponseStatus)status
{
    [self.refreshControl endRefreshing];

    if (status == CCResponseSuccess) {
        [self.carRepository performSelector:@selector(saveCars:) withObject:self.carsRequest.cars];
    } else {
        self.carsRequest.cars = self.carRepository.retrieveAll;
    }

    [self.tableView reloadData];
}

#pragma mark - Setup appearance

- (void)setupAppearance
{
    self.navigationItem.title = @"Cars List";
    self.view.backgroundColor = ScreenBackgroundColor;
    [self.navigationController.navigationBar setBarTintColor:NavigationBarBackgroundColor];
    [self.navigationController.navigationBar setTranslucent:NO];
}

- (void)setupNavigationItems
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddCar)];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.carsRequest count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CCCarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[CCCarCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [self.carsRequest atIndex:indexPath.row].modelName;
    cell.backgroundColor = [UIColor clearColor];

    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.f;
}

#pragma mark - Navigation

- (void)goToAddCar
{
    CCCarFormViewController *carFormViewController = [[CCCarFormViewController alloc] init];
    [self.navigationController pushViewController:carFormViewController animated:YES];
}

@end
