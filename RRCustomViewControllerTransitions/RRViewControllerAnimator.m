//
//  RRViewControllerAnimator.m
//  RRCustomViewControllerTransitions
//
//  Created by Romain Rolland on 15/06/2015.
//  Copyright (c) 2015 rro. All rights reserved.
//

#import "RRViewControllerAnimator.h"

@implementation RRViewControllerAnimator


- (instancetype)initWithType:(RRAnimationType)theType
{
    self = [super init];
    if (self) {
        self.animationType = theType;
    }
    return self;
}

- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    switch (self.animationType) {
        case RRAnimationTypeCircle:
        {
            UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            [[transitionContext containerView] addSubview:toViewController.view];
            toViewController.view.alpha = 0;
            toViewController.view.transform = CGAffineTransformMakeScale(0.1, 0.1);
            
            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                toViewController.view.transform = CGAffineTransformMakeScale(1, 1);
                toViewController.view.alpha = 1;
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                
            }];

        }
            break;
            
        case RRAnimationTypeSquare:
        {
            
        }
            break;
            
        default:
            break;
    }
    }

@end
