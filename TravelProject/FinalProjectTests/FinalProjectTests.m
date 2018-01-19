//
//  FinalProjectTests.m
//  FinalProjectTests
//
//  Created by Masha on 03.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCMock.h"
#import "KMD_WorkWithCoreData.h"
#import "KMD_StartNewTripViewController.h"

@interface FinalProjectTests : XCTestCase

@property (nonatomic,strong) KMD_WorkWithCoreData *workWithCoreData;

@end

@interface KMD_WorkWithCoreData(Testing)
-(void)savingRoute:(NSString *)startPoint toPoint:(NSString *)finishPoint;
-(Routes *)newRouteInfo;
-(NSArray *)listOfRoutes;
-(NSString *)generateURL:(NSString *)inputPoint;
@end

@implementation FinalProjectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGenerateURL
{
    NSString *expectedURL1 = @"https://maps.googleapis.com/maps/api/geocode/json?address=+Moscow&key=AIzaSyChKzhkDLESPzhlAzZR1TMFdawzvg2JzuM";
    NSString *expectedURL2 = @"https://maps.googleapis.com/maps/api/geocode/json?address=+Saint+Petersburg,+Russia&key=AIzaSyChKzhkDLESPzhlAzZR1TMFdawzvg2JzuM";
    OCMExpect([self.workWithCoreData generateURL:@"Moscow"]).andReturn(expectedURL1);
    OCMExpect([self.workWithCoreData generateURL:@"Saint Petersburg, Russia"]).andReturn(expectedURL2);
}


@end

