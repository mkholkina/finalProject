//
//  KMD_StartNewTripViewController.m
//  FinalProject
//
//  Created by Masha on 17.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_StartNewTripViewController.h"
#import "KMD_NewTripMainViewController.h"
#import "KMD_WorkWithCoreData.h"

@interface KMD_StartNewTripViewController ()

@property (nonatomic, strong) UITextField *chooseStartPointTextField;
@property (nonatomic, strong) UITextField *chooseFinishPointTextField;
@property (nonatomic, strong) UIButton *addRouteButton;

@property (nonatomic, strong) KMD_WorkWithCoreData *workWithCoreData;
@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UIImage *createNewTripButtonImage;

@end

static NSString *const backgroundImage1 = @"citiesBackground";
static NSString *const newTripButtonImage1 = @"startNewTripButton";
const CGFloat itemWidth = 3*80.0f+20.0f;
const CGFloat itemHeight = 3*15.0f;
const CGFloat picHeight = 3*20.0f;
const CGFloat itemBottomOffsetY = 400.0f;
const CGFloat itemOffset = 2*10.0f;

@implementation KMD_StartNewTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.workWithCoreData = [KMD_WorkWithCoreData new];
    self.createNewTripButtonImage = [UIImage imageNamed:newTripButtonImage1];
    CGFloat itemBottomOffsetX = (CGRectGetWidth(self.view.frame) - itemWidth)/2;
    
    //background
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImage1]];
    self.backgroundImage.frame = CGRectMake(0,
                                            0,
                                            CGRectGetMaxX(self.view.frame),
                                            CGRectGetMaxY(self.view.frame));
    [self.backgroundImage setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:self.backgroundImage];
    
    //Start point
    
    self.chooseStartPointTextField = [UITextField new];
    self.chooseStartPointTextField.frame = CGRectMake(itemBottomOffsetX,
                                                      itemBottomOffsetY,
                                                      itemWidth,
                                                      itemHeight);
    self.chooseStartPointTextField.textColor = [UIColor whiteColor];
    self.chooseStartPointTextField.text = @"Moscow";
    [self.view addSubview:self.chooseStartPointTextField];
    
    //Finish point
    
    self.chooseFinishPointTextField = [UITextField new];
    self.chooseFinishPointTextField.frame = CGRectMake(itemBottomOffsetX,
                                                       CGRectGetMaxY(self.chooseStartPointTextField.frame) + 4*itemOffset,
                                                       itemWidth,
                                                       itemHeight);
    self.chooseFinishPointTextField.textColor = [UIColor whiteColor];
    self.chooseFinishPointTextField.text = @"Paris";
    [self.view addSubview:self.chooseFinishPointTextField];
    
    //button
    
    self.addRouteButton = [UIButton new];
    self.addRouteButton.frame = CGRectMake(itemBottomOffsetX,
                                           CGRectGetMaxY(self.chooseFinishPointTextField.frame) + 3*itemOffset,
                                           itemWidth,
                                           picHeight);
    self.addRouteButton.backgroundColor = [UIColor whiteColor];
    [self.addRouteButton setImage:self.createNewTripButtonImage forState:UIControlStateNormal];
    [self.addRouteButton setContentMode:UIViewContentModeScaleAspectFit];
    [self.addRouteButton addTarget:self action:@selector(addRouteButtonClick)
                  forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addRouteButton];
}

-(void)addRouteButtonClick
{
    [self.workWithCoreData savingRoute:self.chooseStartPointTextField.text
                                    toPoint:self.chooseFinishPointTextField.text];
    UIViewController *newViewController = [KMD_NewTripMainViewController new];
    [self.navigationController pushViewController:newViewController animated:YES];
}
@end
