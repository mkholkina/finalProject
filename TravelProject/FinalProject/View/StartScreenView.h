//
//  StartScreenView.h
//  FinalProject
//
//  Created by Masha on 10.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StartNewTripScreen.h"
#import "tempViewController.h"

@interface StartScreenView : UIViewController

@property (nonatomic, strong) UIButton *createNewTripButton;
@property (nonatomic, strong) UIButton *openExistingTripButton;
@property (nonatomic, strong) UIButton *openSettingsButton;

@end
