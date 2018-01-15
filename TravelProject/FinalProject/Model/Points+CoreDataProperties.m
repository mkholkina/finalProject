//
//  Points+CoreDataProperties.m
//  FinalProject
//
//  Created by Masha on 16.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//
//

#import "Points+CoreDataProperties.h"

@implementation Points (CoreDataProperties)

+ (NSFetchRequest<Points *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Points"];
}

@dynamic latitude;
@dynamic longitude;
@dynamic name;
@dynamic finishForRoute;
@dynamic startForRoute;

@end
