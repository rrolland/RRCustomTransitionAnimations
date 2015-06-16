//
//  RRViewControllerAnimator.h
//  RRCustomViewControllerTransitions
//
//  Created by Romain Rolland on 15/06/2015.
//  Copyright (c) 2015 rro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum {
    RRAnimationTypeCircle = 0,
    RRAnimationTypeSquare = 1,
} RRAnimationType;

@interface RRViewControllerAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) RRAnimationType animationType;

- (instancetype)initWithType:(RRAnimationType)theType;

@end
