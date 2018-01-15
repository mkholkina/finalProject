//
//  Points+CoreDataProperties.h
//  FinalProject
//
//  Created by Masha on 16.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//
//

#import "Points+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Points (CoreDataProperties)

+ (NSFetchRequest<Points *> *)fetchRequest;

@property (nonatomic) double latitude;
@property (nonatomic) double longitude;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) Routes *finishForRoute;
@property (nullable, nonatomic, retain) Routes *startForRoute;

@end

NS_ASSUME_NONNULL_END
