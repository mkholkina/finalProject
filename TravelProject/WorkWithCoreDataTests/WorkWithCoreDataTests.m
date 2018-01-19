//
//  WorkWithCoreDataTests.m
//  WorkWithCoreDataTests
//
//  Created by Masha on 19.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "KMD_WorkWithCoreData.h"

@interface WorkWithCoreDataTests : XCTestCase

@end

@interface KMD_WorkWithCoreData(Testing)
-(void)savingRoute:(NSString *)startPoint toPoint:(NSString *)finishPoint;
-(Routes *)newRouteInfo;
-(NSArray *)listOfRoutes;
@end


@implementation WorkWithCoreDataTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNewRouteInfo {
    
}

@end
