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
            UIView *containerView = transitionContext.containerView;
            UIViewController* toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
            UIViewController* fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
            
            //var button = fromViewController.button
            CGRect buttonFrame = CGRectMake((fromViewController.view.frame.size.width/2) - 30, 100, 60, 60);

            [containerView addSubview:toViewController.view];

            UIBezierPath *circleMaskPathInitial = [UIBezierPath bezierPathWithOvalInRect:buttonFrame];
            
            CGPoint extremePoint = CGPointMake(0, CGRectGetHeight(toViewController.view.bounds));
            CGFloat radius = sqrt((extremePoint.x*extremePoint.x) + (extremePoint.y*extremePoint.y));
            UIBezierPath *circleMaskPathFinal = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(buttonFrame, -radius, -radius)];
            
            //5
            CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
            [maskLayer setPath:circleMaskPathFinal.CGPath];
            toViewController.view.layer.mask = maskLayer;

            [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
                CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
                maskLayerAnimation.fromValue = (__bridge id)(circleMaskPathInitial.CGPath);
                maskLayerAnimation.toValue = (__bridge id)(circleMaskPathFinal.CGPath);
                maskLayerAnimation.duration = 0.3;
                maskLayerAnimation.delegate = self;
                [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
            } completion:^(BOOL finished) {
                fromViewController.view.transform = CGAffineTransformIdentity;
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
                
            }];
        }
            break;
            
        case RRAnimationTypeSquare:
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
            
        default:
            break;
    }
    }

@end
