//
//  NavPop.m
//  HMW_UserInterAnim
//
//  Created by Константин on 27.11.17.
//  Copyright © 2017 Konstantin. All rights reserved.
//

#import "NavPop.h"

@implementation NavPop

- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 2.0f;
}
// This method can only  be a nop if the transition is interactive and not a percentDriven interactive transition.
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *view = transitionContext.containerView;
    UIViewController *source = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *destination = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [view addSubview: destination.view];
    destination.view.alpha = 0.0;
    [view addSubview:source.view];
    source.view.transform = CGAffineTransformScale( source.view.transform,1, 1);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        source.view.transform = CGAffineTransformScale( source.view.transform,0.01, 0.01);
        destination.view.alpha = 1.0;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
}
@end
