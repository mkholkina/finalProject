//
//  NewTripActions.h
//  FinalProject
//
//  Created by Masha on 13.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "CoordinatesForGMaps.h"

#import "Routes+CoreDataClass.h"
#import "Routes+CoreDataProperties.h"
#import "Points+CoreDataClass.h"
#import "Points+CoreDataProperties.h"


@interface NewTripActions : NSObject

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;

-(void)saveInCoreDataPoint:(NSString *)inputPoint fromRoute:(Routes *)route withIdentifier:(NSInteger)identifier;
-(void)startSavingRoute:(NSString *)startPoint toPoint:(NSString *)finishPoint;
-(Routes *)NewRouteInfo;

@end
