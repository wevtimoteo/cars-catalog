//
//  CCCarsViewController.m
//  Cars-Catalog
//
//  Created by Weverton Couto Timoteo on 9/7/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "CCCarsViewController.h"
#import "CCCarFormViewController.h"

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
    [self.tableView reloadData];

    [self.carRepository saveCars:self.carsRequest.cars];
}

#pragma mark - Setup appearance

- (void)setupAppearance
{
    self.navigationItem.title = @"Cars List";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)setupNavigationItems
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToAddCar)];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [self.carsRequest atIndex:indexPath.row].modelName;

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
