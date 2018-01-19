//
//  KMD_NavigationControllerDelegate.m
//  FinalProject
//
//  Created by Masha on 18.01.2018.
//  Copyright © 2018 Kholkina Maria. All rights reserved.
//

#import "KMD_NavigationControllerDelegate.h"
#import "KMD_PushAnimation.h"
#import "KMD_PopAnimation.h"

@implementation KMD_NavigationControllerDelegate

- (id <UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController
                                    animationControllerForOperation:(UINavigationControllerOperation)operation
                                                 fromViewController:(UIViewController *)fromVC
                                                   toViewController:(UIViewController *)toVC
{
    return operation == UINavigationControllerOperationPush ? [KMD_PushAnimation new] : [KMD_PopAnimation new];
}

@end
