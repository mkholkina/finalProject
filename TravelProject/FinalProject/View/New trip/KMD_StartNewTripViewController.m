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

@property (nonatomic, strong) UIImageView *backgroundImage;
@property (nonatomic, strong) UIImage *createNewTripButtonImage;

@property (nonatomic, strong) UIImageView *startPointImageView;
@property (nonatomic, strong) UITextField *chooseStartPointTextField;

@property (nonatomic, strong) UIImageView *finishPointImageView;
@property (nonatomic, strong) UITextField *chooseFinishPointTextField;

@property (nonatomic, strong) UIButton *addRouteButton;
@property (nonatomic, strong) KMD_WorkWithCoreData *workWithCoreData;

@end

static NSString *const backgroundImage1 = @"chooseYourCityBack";
static NSString *const newTripButtonImage1 = @"startNewTripButton";
static NSString *const startPointViewBack = @"startPoint";
static NSString *const finishPointViewBack = @"finishPoint";

const CGFloat koef = 3.5;
const CGFloat offsetBetweenItems = 40.0f;
const CGSize imageSize = {koef * 80.5f, koef * 20.0f};
const CGSize itemSize = {koef * 80.5f, koef * 27.7f};


@implementation KMD_StartNewTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.workWithCoreData = [KMD_WorkWithCoreData new];
    self.createNewTripButtonImage = [UIImage imageNamed:newTripButtonImage1];
    
    CGSize itemBottomOffset = {(CGRectGetWidth(self.view.frame) - itemSize.width)/2,
                               CGRectGetHeight(self.view.frame) - itemSize.height*2 - imageSize.height - offsetBetweenItems*3};

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
    
    self.startPointImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:startPointViewBack]];
    self.startPointImageView.frame = CGRectMake(itemBottomOffset.width,
                                                itemBottomOffset.height,
                                                itemSize.width,
                                                itemSize.height);
    [self.startPointImageView setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:self.startPointImageView];
    
    self.chooseStartPointTextField = [UITextField new];
    self.chooseStartPointTextField.frame = CGRectMake(itemBottomOffset.width,
                                                      self.startPointImageView.center.y,
                                                      itemSize.width,
                                                      itemSize.height/2);
    self.chooseStartPointTextField.textColor = [UIColor whiteColor];
    self.chooseStartPointTextField.text = @"Moscow";
    [self.view addSubview:self.chooseStartPointTextField];
    
    
    //Finish point
    
    self.finishPointImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:finishPointViewBack]];
    self.finishPointImageView.frame = CGRectMake(itemBottomOffset.width,
                                                 CGRectGetMaxY(self.startPointImageView.frame) + offsetBetweenItems,
                                                 itemSize.width,
                                                 itemSize.height);
    [self.finishPointImageView setContentMode:UIViewContentModeScaleToFill];
    [self.view addSubview:self.finishPointImageView];
    
    self.chooseFinishPointTextField = [UITextField new];
    self.chooseFinishPointTextField.frame = CGRectMake(itemBottomOffset.width,
                                                      self.finishPointImageView.center.y,
                                                      itemSize.width,
                                                      itemSize.height/2);
    self.chooseFinishPointTextField.textColor = [UIColor whiteColor];
    self.chooseFinishPointTextField.text = @"Paris";
    [self.view addSubview:self.chooseFinishPointTextField];
    
    //button
    self.addRouteButton = [UIButton new];
    self.addRouteButton.frame = CGRectMake(itemBottomOffset.width,
                                           CGRectGetMaxY(self.finishPointImageView.frame) + offsetBetweenItems,
                                           imageSize.width,
                                           imageSize.height);
    
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
