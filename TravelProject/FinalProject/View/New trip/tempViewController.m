//
//  tempViewController.m
//  FinalProject
//
//  Created by Masha on 13.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "tempViewController.h"

@interface tempViewController ()

@property (nonatomic, strong) UIImageView *backgroundImage;

@end

static NSString *const backgroundImage2 = @"test1";

@implementation tempViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImage2]];
    self.backgroundImage.frame = CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame));
    [self.backgroundImage setContentMode:UIViewContentModeScaleToFill];
    
    [self.view addSubview:self.backgroundImage];
}

@end
