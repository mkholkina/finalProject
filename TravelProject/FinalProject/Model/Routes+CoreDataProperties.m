//
//  Routes+CoreDataProperties.m
//  FinalProject
//
//  Created by Masha on 16.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//
//

#import "Routes+CoreDataProperties.h"

@implementation Routes (CoreDataProperties)

+ (NSFetchRequest<Routes *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Routes"];
}

@dynamic finishPoint;
@dynamic startPoint;

@end
