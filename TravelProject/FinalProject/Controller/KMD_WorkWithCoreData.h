//
//  KMD_WorkWithCoreData.h
//  FinalProject
//
//  Created by Masha on 17.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Routes+CoreDataClass.h"
#import "Points+CoreDataClass.h"

@interface KMD_WorkWithCoreData : NSObject

-(void)savingRoute:(NSString *)startPoint toPoint:(NSString *)finishPoint;
-(Routes *)newRouteInfo;
-(NSArray *)listOfRoutes;

@end
