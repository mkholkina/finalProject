//
//  KMD_PopAnimation.m
//  FinalProject
//
//  Created by Masha on 19.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_PopAnimation.h"

@implementation KMD_PopAnimation

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 2.0;
};

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = transitionContext.containerView;
    UIViewController *destinationView =[transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    [containerView addSubview: destinationView.view];
    destinationView.view.alpha = 0.0;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        destinationView.view.alpha = 1.0;
    } completion:^(BOOL finished){
        [transitionContext completeTransition: YES];
    }];
};

@end
