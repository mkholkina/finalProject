//
//  KMD_NewTripMainViewController.m
//  FinalProject
//
//  Created by Masha on 17.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_NewTripMainViewController.h"
#import "KMD_StartScreenViewController.h"
#import "KMD_TempViewController.h"
#import "KMD_GoogleMapsViewController.h"
#import "Routes+CoreDataClass.h"
#import "Points+CoreDataClass.h"
#import "KMD_WorkWithCoreData.h"

@interface KMD_NewTripMainViewController ()

@property (nonatomic, strong) KMD_TempViewController *tmpController;
@property (nonatomic, strong) KMD_GoogleMapsViewController *mapController;
@property (nonatomic, strong) UINavigationBar *navigationBar;

@property (nonatomic, strong) KMD_WorkWithCoreData *workWithCoreData;

@end

const CGFloat navigationBarHeight = 30.0f;
static NSString *const routeIcon = @"mapIcon";
static NSString *const faveIcon = @"placeToVisitIcon";

@implementation KMD_NewTripMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.workWithCoreData = [KMD_WorkWithCoreData new];
    
    //настройка TabBar-а
    
    
    self.mapController = [KMD_GoogleMapsViewController new];
    self.tmpController = [KMD_TempViewController new];

    UITabBarItem *tmpTabBarItem = [[UITabBarItem alloc] initWithTitle:@"route"
                                                                image:[UIImage imageNamed:faveIcon]
                                                        selectedImage:[UIImage imageNamed:faveIcon]];
    UITabBarItem *mapTabBarItem = [[UITabBarItem alloc] initWithTitle:@"visit"
                                                                image:[UIImage imageNamed:routeIcon]
                                                        selectedImage:[UIImage imageNamed:routeIcon]];
    
    self.mapController.tabBarItem = mapTabBarItem;
    self.tmpController.tabBarItem = tmpTabBarItem;
    
    NSArray *arrayOfControllers = @[self.tmpController, self.mapController];
    [self setViewControllers:arrayOfControllers];
    
    
    //настройка NavigationBar-а
    
    
    self.navigationBar = [UINavigationBar new];
    self.navigationBar.frame = CGRectMake(0, 0, self.view.frame.size.width, navigationBarHeight);
    
    Routes *route = [self.workWithCoreData newRouteInfo];
    NSString *navigationBarTitle = [NSString stringWithFormat:@"%@ -> %@", route.startPoint.name,
                                    route.finishPoint.name];
    
    UINavigationItem* navigationBarItem = [[UINavigationItem alloc] initWithTitle:navigationBarTitle];
    UIBarButtonItem* backToMainMenu = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                               target:self
                                                                               action:@selector(backToMainMenuClick:)];
    navigationBarItem.leftBarButtonItem = backToMainMenu;

    [self.navigationBar setItems:@[navigationBarItem]];
    [self.view addSubview:self.navigationBar];
}

-(void)backToMainMenuClick:(UIBarButtonItem*)item
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
