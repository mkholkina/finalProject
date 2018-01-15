//
//  StartNewTripScreen.h
//  FinalProject
//
//  Created by Masha on 10.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NewTripMainScreen.h"
#import "NewTripActions.h"

@interface StartNewTripScreen : UIViewController

@property (nonatomic, strong) UILabel *addStartPointLabel;
@property (nonatomic, strong) UITextField *chooseStartPointTextField;

@property (nonatomic, strong) UILabel *addFinishPointLabel;
@property (nonatomic, strong) UITextField *chooseFinishPointTextField;

@property (nonatomic, strong) UIButton *addMiddlePointButton;
@property (nonatomic, strong) UIButton *addRouteButton;

@property (nonatomic, strong) NSManagedObjectContext *coreDataContext;
@property (nonatomic, strong) NewTripActions *workWithNewTrip;

@end
