//
//  KMD_PreviousTripsViewController.m
//  FinalProject
//
//  Created by Masha on 18.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_PreviousTripsViewController.h"
#import "KMD_PreviousTripsTableViewCell.h"
#import "KMD_WorkWithCoreData.h"
#import "KMD_StartScreenViewController.h"

@interface KMD_PreviousTripsViewController ()

@property (nonatomic, strong) UINavigationBar *navigationBar;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) KMD_WorkWithCoreData *workWithCoreData;
@property (nonatomic, copy) NSMutableArray <Routes *>* routesList;

@end

static NSString *const previousTripsTableViewCellIdentifier = @"KMD_PreviousTripsTableViewCell";
const CGFloat navigationBarHeight1 = 30.0f;

@implementation KMD_PreviousTripsViewController


- (instancetype)init
{
    NSLog(@"ViewController");
    self = [super init];
    if (self)
    {
        self.workWithCoreData = [KMD_WorkWithCoreData new];
        NSArray *listOfRoutes = [self.workWithCoreData listOfRoutes];
        _routesList = [NSMutableArray arrayWithArray:listOfRoutes];
        
        NSLog(@"%lu",(unsigned long)listOfRoutes.count);
        for (Routes *i in _routesList)
        {
            NSLog(@"%@, %@",i.startPoint.name, i.finishPoint.name);
        }
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [UITableView new];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.frame = CGRectMake (0,
                                       navigationBarHeight1+10,
                                       CGRectGetWidth(self.view.frame),
                                       CGRectGetHeight(self.view.frame));
    [self.tableView registerClass:[KMD_PreviousTripsTableViewCell class]
           forCellReuseIdentifier:previousTripsTableViewCellIdentifier];
    [self.view addSubview:self.tableView];
    
    self.navigationBar = [UINavigationBar new];
    self.navigationBar.frame = CGRectMake(0,
                                          0,
                                          self.view.frame.size.width,
                                          navigationBarHeight1);
    
    UINavigationItem *navigationBarItem = [[UINavigationItem alloc] initWithTitle:@"Your previous routes"];
    UIBarButtonItem *backToMainMenu = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                    target:self
                                                                                    action:@selector(backToMainMenuClick)];
    navigationBarItem.leftBarButtonItem = backToMainMenu;
    [self.navigationBar setItems:@[navigationBarItem]];
    [self.view addSubview:self.navigationBar];
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView
                 cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    Routes *route = self.routesList[indexPath.row];
    cell = [tableView dequeueReusableCellWithIdentifier:previousTripsTableViewCellIdentifier forIndexPath:indexPath];
    KMD_PreviousTripsTableViewCell *routeCell = (id)cell;
    routeCell.routeName.text = [NSString stringWithFormat:@"From: %@ to %@",
                                route.startPoint.name, route.finishPoint.name];
    routeCell.routeDescription.text = [NSString stringWithFormat:@"(%f, %f) -> (%f, %f)",
                                       route.startPoint.latitude, route.startPoint.longitude,
                                       route.finishPoint.latitude, route.finishPoint.longitude];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return self.routesList.count;
}


-(void)backToMainMenuClick
{
    NSLog(@"Cancel");
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
}
@end
