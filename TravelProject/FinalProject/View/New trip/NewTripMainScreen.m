//
//  NewTripMainScreen.m
//  FinalProject
//
//  Created by Masha on 10.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "NewTripMainScreen.h"

@interface NewTripMainScreen ()

@end

@implementation NewTripMainScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.workWithNewTrip = [NewTripActions new];
    self.mapController = [GMapsController new];
    self.tmpController = [tempViewController new];
    
    UITabBarItem *mapTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:1];
    UITabBarItem *tmpTabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemMore tag:0];
    
    self.mapController.tabBarItem = mapTabBarItem;
    self.tmpController.tabBarItem = tmpTabBarItem;
    
    NSArray *arrayOfControllers = @[self.tmpController, self.mapController];
    [self setViewControllers:arrayOfControllers];
    
    self.navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    
    Routes *route = [self.workWithNewTrip NewRouteInfo];
    NSString *navBarTitle = [NSString stringWithFormat:@"%@ -> %@",route.startPoint.name, route.finishPoint.name];
    
    UINavigationItem* navItem = [[UINavigationItem alloc] initWithTitle:navBarTitle];
    //[self.navBar setBarTintColor:[UIColor lightGrayColor]];
    UIBarButtonItem* cancelBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                               target:self
                                                                               action:@selector(onTapCancel:)];
    navItem.leftBarButtonItem = cancelBtn;
    
    UIBarButtonItem* doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                             target:self action:@selector(onTapDone:)];
    navItem.rightBarButtonItem = doneBtn;
    
    [self.navBar setItems:@[navItem]];
    [self.view addSubview:self.navBar];
}


-(void)onTapDone:(UIBarButtonItem*)item{
    NSLog(@"Done");
}

-(void)onTapCancel:(UIBarButtonItem*)item{
    NSLog(@"Cancel");
    UIViewController *newViewController = [StartScreenView new];
    [self presentViewController:newViewController animated:YES completion:^{
        NSLog(@"Transition");
    }];
}
@end
