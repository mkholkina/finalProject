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
const CGFloat buttonOffset = 30.0f + buttonHeight;

static NSString *const backgroundImage = @"mainScreenBackground";
static NSString *const newTripButtonImage = @"button1";
static NSString *const existingTripButtonImage = @"button2";
static NSString *const settingsButtonImage = @"button3";

@implementation KMD_StartScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Start");
    [self.navigationController setNavigationBarHidden:YES];
    //background
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImage]];
    self.backgroundImage.frame = CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame));
    [self.backgroundImage setContentMode:UIViewContentModeScaleToFill];
    
    [self.view addSubview:self.backgroundImage];
    
    //prepare
    
    CGFloat buttonY = CGRectGetHeight(self.view.frame) - buttonOffset * 4;
    CGFloat buttonX = (CGRectGetWidth(self.view.frame) - buttonWidth) / 2;

    self.createNewTripButtonImage = [UIImage imageNamed:newTripButtonImage];
    self.openExistingTripButtonImage = [UIImage imageNamed:existingTripButtonImage];
    self.openSettingsButtonImage = [UIImage imageNamed:settingsButtonImage];
    
    //buttons
    
    self.createNewTripButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
    [self.createNewTripButton setImage:self.createNewTripButtonImage forState:UIControlStateNormal];
    [self.createNewTripButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.createNewTripButton addTarget:self action:@selector(createNewTripButtonClick)
                       forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.createNewTripButton];
    
    
    self.openExistingTripButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY + buttonOffset,
                                                                             buttonWidth, buttonHeight)];
    [self.openExistingTripButton setImage:self.openExistingTripButtonImage forState:UIControlStateNormal];
    [self.openExistingTripButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.openExistingTripButton addTarget:self action:@selector(openExistingTripButtonClick)
                          forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openExistingTripButton];
    
    
    self.openSettingsButton = [[UIButton alloc] initWithFrame:CGRectMake(buttonX, buttonY + buttonOffset * 2,
                                                                         buttonWidth, buttonHeight)];
    [self.openSettingsButton setImage:self.openSettingsButtonImage forState:UIControlStateNormal];
    [self.openSettingsButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.openSettingsButton addTarget:self action:@selector(openSettingsButtonClick)
                      forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openSettingsButton];
}

-(void)createNewTripButtonClick
{
    NSLog(@"Creating...");
    UIViewController *newViewController = [KMD_StartNewTripViewController new];
    [self.navigationController pushViewController:newViewController animated:YES];
}

-(void)openExistingTripButtonClick
{
    NSLog(@"Opening...");
    UIViewController *newViewController = [KMD_PreviousTripsViewController new];
    [self.navigationController pushViewController:newViewController animated:YES];
}

-(void)openSettingsButtonClick
{
    NSLog(@"Settings...");
}
@end
