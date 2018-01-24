//
//  KMD_StartScreenViewController.m
//  FinalProject
//
//  Created by Masha on 17.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_StartScreenViewController.h"
#import "KMD_StartNewTripViewController.h"
#import "KMD_PreviousTripsViewController.h"


@interface KMD_StartScreenViewController ()

@property (nonatomic, strong) UIButton *createNewTripButton;
@property (nonatomic, strong) UIButton *openExistingTripButton;
@property (nonatomic, strong) UIButton *openSettingsButton;

@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UIImage *createNewTripButtonImage;
@property (nonatomic, strong) UIImage *openExistingTripButtonImage;
@property (nonatomic, strong) UIImage *openSettingsButtonImage;

@end

const CGFloat buttonWidth = 3 * 80.0f;
const CGFloat buttonHeight = 3 * 20.0f;
const CGFloat buttonOffset = 30.0f;
const CGFloat buttonOffset2 = 30.0f + buttonHeight;

static NSString *const backgroundImage = @"mainScreenBackground";
static NSString *const newTripButtonImage = @"button1";
static NSString *const existingTripButtonImage = @"button2";
static NSString *const settingsButtonImage = @"button3";

@implementation KMD_StartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    //background
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImage]];
    self.backgroundImage.frame = CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame));
    [self.backgroundImage setContentMode:UIViewContentModeScaleToFill];
    
    [self.view addSubview:self.backgroundImage];
    
    //prepare
    
    CGFloat buttonY = CGRectGetHeight(self.view.frame) - buttonOffset2 * 4;
    CGFloat buttonX = (CGRectGetWidth(self.view.frame) - buttonWidth) / 2;
    CGFloat buttonYDown = buttonOffset2 + buttonOffset;

    self.createNewTripButtonImage = [UIImage imageNamed:newTripButtonImage];
    self.openExistingTripButtonImage = [UIImage imageNamed:existingTripButtonImage];
    self.openSettingsButtonImage = [UIImage imageNamed:settingsButtonImage];
    
    //buttons
    
    self.createNewTripButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.createNewTripButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.createNewTripButton setImage:self.createNewTripButtonImage forState:UIControlStateNormal];
    [self.createNewTripButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.createNewTripButton addTarget:self action:@selector(createNewTripButtonClick)
                       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.createNewTripButton];
    
    
    self.openExistingTripButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.openExistingTripButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.openExistingTripButton setImage:self.openExistingTripButtonImage forState:UIControlStateNormal];
    [self.openExistingTripButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.openExistingTripButton addTarget:self action:@selector(openExistingTripButtonClick)
                          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openExistingTripButton];
    
    
    self.openSettingsButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.openSettingsButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.openSettingsButton setImage:self.openSettingsButtonImage forState:UIControlStateNormal];
    [self.openSettingsButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.openSettingsButton addTarget:self action:@selector(openSettingsButtonClick)
                      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openSettingsButton];
    
    
    //constraints
    
    
    NSDictionary *dict =  @{
                            @"backgroundImage": self.backgroundImage,
                            @"createNewTripButton": self.createNewTripButton,
                            @"openExistingTripButton": self.openExistingTripButton,
                            @"openSettingsButton": self.openSettingsButton
                            };

    NSDictionary *metrics = @{
                              @"buttonWidth":@(buttonWidth),
                              @"buttonHeight":@(buttonHeight),
                              @"buttonOffset":@(buttonOffset),
                              @"buttonY":@(buttonY),
                              @"buttonX":@(buttonX),
                              @"buttonYDown":@(buttonYDown)
                              };
    
    NSArray *buttonsConstrV = [NSLayoutConstraint
                               constraintsWithVisualFormat: @"V:|-buttonY-[createNewTripButton(buttonHeight)]-buttonOffset-[openExistingTripButton(buttonHeight)]-buttonOffset-[openSettingsButton(buttonHeight)]-buttonYDown-|"
                               options:0
                               metrics:metrics
                               views:dict];
    [self.view addConstraints: buttonsConstrV];
    
    NSArray *createNewTripButtonConstrH = [NSLayoutConstraint
                                           constraintsWithVisualFormat: @"H:|-buttonX-[createNewTripButton(buttonWidth)]-buttonX-|"
                                           options:0
                                           metrics:metrics
                                           views:dict];
    [self.view addConstraints: createNewTripButtonConstrH];
    
    NSArray *openExistingTripButtonConstrH = [NSLayoutConstraint
                                              constraintsWithVisualFormat: @"H:|-buttonX-[openExistingTripButton(buttonWidth)]-buttonX-|"
                                              options:0
                                              metrics:metrics
                                              views:dict];
    [self.view addConstraints: openExistingTripButtonConstrH];
    
    NSArray *openSettingsButtonConstrH = [NSLayoutConstraint
                                          constraintsWithVisualFormat: @"H:|-buttonX-[openSettingsButton(buttonWidth)]-buttonX-|"
                                          options:0
                                          metrics:metrics
                                          views:dict];
    [self.view addConstraints: openSettingsButtonConstrH];
}

-(void)createNewTripButtonClick
{
    UIViewController *newViewController = [KMD_StartNewTripViewController new];
    [self.navigationController pushViewController:newViewController animated:YES];
}

-(void)openExistingTripButtonClick
{
    UIViewController *newViewController = [KMD_PreviousTripsViewController new];
    [self.navigationController pushViewController:newViewController animated:YES];
}

-(void)openSettingsButtonClick
{
    NSLog(@"Settings...");
}
@end
