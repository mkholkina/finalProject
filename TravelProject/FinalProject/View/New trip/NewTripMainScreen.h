//
//  NewTripMainScreen.h
//  FinalProject
//
//  Created by Masha on 10.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tempViewController.h"
#import "GMapsController.h"
#import "NewTripActions.h"
#import "StartScreenView.h"

#import "Routes+CoreDataClass.h"
#import "Routes+CoreDataProperties.h"
#import "Points+CoreDataClass.h"
#import "Points+CoreDataProperties.h"

@interface NewTripMainScreen : UITabBarController

@property (nonatomic, strong) tempViewController *tmpController;
@property (nonatomic, strong) GMapsController *mapController;
@property (nonatomic, strong) UINavigationBar *navBar;

@property (nonatomic, strong) NewTripActions *workWithNewTrip;

@end
