//
//  StartScreenView.m
//  FinalProject
//
//  Created by Masha on 10.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "StartScreenView.h"

@interface StartScreenView ()

@end

@implementation StartScreenView

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Start");
    
    //background
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //buttons
    
    CGFloat buttonX = 100.0f;
    CGFloat buttonY = 400.0f;
    CGFloat buttonWidth = 200.0f;
    CGFloat buttonHeight = 50.0f;
    UIColor *buttonColour = [UIColor blueColor];
    
    self.createNewTripButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
    self.createNewTripButton.backgroundColor = buttonColour;
    [self.createNewTripButton setTitle:@"Create new trip" forState:UIControlStateNormal];
    [self.createNewTripButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.createNewTripButton addTarget:self action:@selector(createNewTrip) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.createNewTripButton];
    
    
    self.openExistingTripButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY+100, buttonWidth,
                                                                             buttonHeight)];
    self.openExistingTripButton.backgroundColor = buttonColour;
    [self.openExistingTripButton setTitle:@"Open existing trip" forState:UIControlStateNormal];
    [self.openExistingTripButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.openExistingTripButton addTarget:self action:@selector(openExistingTrip) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openExistingTripButton];
    
    
    self.openSettingsButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY+200, buttonWidth,
                                                                         buttonHeight)];
    self.openSettingsButton.backgroundColor = buttonColour;
    [self.openSettingsButton setTitle:@"Settings" forState:UIControlStateNormal];
    [self.openSettingsButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.openSettingsButton addTarget:self action:@selector(openSettings) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openSettingsButton];
    
}

-(void)createNewTrip
{
    NSLog(@"Creating...");
    UIViewController *newViewController = [StartNewTripScreen new];
    [self presentViewController:newViewController animated:YES completion:^{
        NSLog(@"Transition");
    }];
}

-(void)openExistingTrip
{
    NSLog(@"Opening...");
    UIViewController *newViewController = [tempViewController new];
    [self presentViewController:newViewController animated:YES completion:^{
        NSLog(@"Transition");
    }];
}

-(void)openSettings
{
    NSLog(@"Settings...");
}

@end
