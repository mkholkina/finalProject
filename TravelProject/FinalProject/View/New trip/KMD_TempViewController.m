//
//  KMD_TempViewController.m
//  FinalProject
//
//  Created by Masha on 19.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_TempViewController.h"

@interface KMD_TempViewController ()

@property (nonatomic, strong) UIImageView *backgroundImage;

@end

static NSString *const backgroundImage2 = @"test1";

@implementation KMD_TempViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:backgroundImage2]];
    self.backgroundImage.frame = CGRectMake(0, 0, CGRectGetMaxX(self.view.frame), CGRectGetMaxY(self.view.frame));
    [self.backgroundImage setContentMode:UIViewContentModeScaleToFill];
    
    [self.view addSubview:self.backgroundImage];
}

@end
