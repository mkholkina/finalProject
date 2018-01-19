//
//  KMD_PushAnimation.m
//  FinalProject
//
//  Created by Masha on 19.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_PushAnimation.h"


@interface KMD_PushAnimation()

@property (nonatomic,strong) UIView *transitionView;
@property (nonatomic, strong) UIImageView *planeImage;

@end

static NSString *const animationPicture = @"loadingPic";

@implementation KMD_PushAnimation

- (NSTimeInterval) transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 7.0;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = transitionContext.containerView;
    
    self.planeImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:animationPicture]];
    self.planeImage.frame = CGRectMake(0, 0, 20, 20);
    [self.planeImage setContentMode:UIViewContentModeScaleToFill];
    
    self.transitionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(containerView.frame), CGRectGetHeight(containerView.frame))];
    self.transitionView.backgroundColor = [UIColor grayColor];
    
    UIViewController *destinationView =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview: destinationView.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        [containerView addSubview:self.transitionView];
        [self.transitionView addSubview:self.planeImage];
        CABasicAnimation *posAnimation;
        posAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
        posAnimation.duration = 0.5;
        posAnimation.repeatCount = 10;
        posAnimation.autoreverses = YES;
        posAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.transitionView.frame)/2,
                                                                       CGRectGetHeight(self.transitionView.frame)/2)];
        posAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetWidth(self.transitionView.frame)/2,
                                                                     CGRectGetHeight(self.transitionView.frame)/2 - 50)];
        [self.planeImage.layer addAnimation:posAnimation forKey:nil];
        self.transitionView.alpha = 0.0;
    } completion:^(BOOL finished){
        [transitionContext completeTransition: YES];
    }];
};

@end
