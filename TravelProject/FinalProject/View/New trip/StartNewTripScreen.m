//
//  StartNewTripScreen.m
//  FinalProject
//
//  Created by Masha on 10.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "StartNewTripScreen.h"

@interface StartNewTripScreen ()

@end

@implementation StartNewTripScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    self.workWithNewTrip = [NewTripActions new];
    
    //background
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    //Start point
    
    self.addStartPointLabel = [[UILabel alloc] initWithFrame: CGRectMake(50, 100, 300, 50)];
    self.addStartPointLabel.backgroundColor = [UIColor whiteColor];
    self.addStartPointLabel.textColor = [UIColor blueColor];
    self.addStartPointLabel.text = @"Choose start city of your trip:";
    [self.view addSubview:self.addStartPointLabel];
    
    self.chooseStartPointTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, 300, 50)];
    self.chooseStartPointTextField.backgroundColor = [UIColor lightGrayColor];
    self.chooseStartPointTextField.textColor = [UIColor whiteColor];
    //self.chooseStartPointTextField.text = @"Input city";
    [self.view addSubview:self.chooseStartPointTextField];
    
    //Finish point
    
    self.addFinishPointLabel = [[UILabel alloc] initWithFrame: CGRectMake(50, 250, 300, 50)];
    self.addFinishPointLabel.backgroundColor = [UIColor whiteColor];
    self.addFinishPointLabel.textColor = [UIColor blueColor];
    self.addFinishPointLabel.text = @"Choose finish city of your trip:";
    [self.view addSubview:self.addFinishPointLabel];
    
    self.chooseFinishPointTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, 300, 50)];
    self.chooseFinishPointTextField.backgroundColor = [UIColor lightGrayColor];
    self.chooseFinishPointTextField.textColor = [UIColor whiteColor];
    //self.chooseFinishPointTextField.text = @"Input city";
    [self.view addSubview:self.chooseFinishPointTextField];
    
    //button
    
    self.addRouteButton = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 300, 50)];
    self.addRouteButton.backgroundColor = [UIColor blueColor];
    [self.addRouteButton setTitle:@"Create trip" forState:UIControlStateNormal];
    [self.addRouteButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.addRouteButton addTarget:self action:@selector(addRoute) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.addRouteButton];
}

-(void)addRoute
{
    NSLog(@"Saving...");
    [self.workWithNewTrip startSavingRoute:self.chooseStartPointTextField.text
                                   toPoint:self.chooseFinishPointTextField.text];
    UIViewController *newViewController = [NewTripMainScreen new];
    [self presentViewController:newViewController animated:YES completion:^{
        NSLog(@"Transition");
    }];
}


@end
