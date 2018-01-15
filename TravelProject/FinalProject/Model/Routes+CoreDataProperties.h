//
//  Routes+CoreDataProperties.h
//  FinalProject
//
//  Created by Masha on 16.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//
//

#import "Routes+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Routes (CoreDataProperties)

+ (NSFetchRequest<Routes *> *)fetchRequest;

@property (nullable, nonatomic, retain) Points *finishPoint;
@property (nullable, nonatomic, retain) Points *startPoint;

@end

NS_ASSUME_NONNULL_END
