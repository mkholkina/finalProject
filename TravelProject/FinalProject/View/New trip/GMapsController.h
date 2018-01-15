//
//  GMapsController.h
//  FinalProject
//
//  Created by Masha on 13.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>
#import "CoordinatesForGMaps.h"
#import "NewTripActions.h"

#import "Routes+CoreDataClass.h"
#import "Routes+CoreDataProperties.h"
#import "Points+CoreDataClass.h"
#import "Points+CoreDataProperties.h"

@interface GMapsController : UIViewController

@property (nonatomic, strong) NewTripActions *workWithNewTrip;

@end
