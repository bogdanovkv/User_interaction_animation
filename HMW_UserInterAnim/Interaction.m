//
//  Interaction.m
//  HMW_UserInterAnim
//
//  Created by Константин on 27.11.17.
//  Copyright © 2017 Konstantin. All rights reserved.
//

#import "Interaction.h"
@interface Interaction()

@property (nonatomic, strong) UINavigationController* viewController;
@property (nonatomic, assign) BOOL isInProcess;
@property (nonatomic, assign) BOOL isComplete;
@property (nonatomic, strong) UITapGestureRecognizer *gestRec;

@property (nonatomic, assign) CGFloat progress;

@end

@implementation Interaction



-(instancetype)initWithViewController: (UINavigationController*) viewController andRecognaiser: (UITapGestureRecognizer*) recognaiser
{
    self = [super init];
    
    if (self)
    {
        _viewController = viewController;
        _isInProcess = YES;
        [recognaiser addTarget:self action:@selector(gestureHandle:)];
     //   UIPanGestureRecognizer *gestRec = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandle:)];
        [_viewController.view addGestureRecognizer:recognaiser];
    }
    return self;
}

- (void) gestureHandle: (UIPanGestureRecognizer*) gestRec
{
    
    switch (gestRec.state)
    {
        case UIGestureRecognizerStateBegan:
            self.isInProcess = YES;
            self.progress = 0;
            break;
            
        case UIGestureRecognizerStateChanged:
            
            self.progress = [gestRec translationInView:self.viewController.view].x/(self.viewController.view.bounds.size.width/2);
            if(self.progress > 0.7)
            {
                self.isComplete = YES;
            }
            else
            {
                self.isComplete = NO;
            }
            if(self.progress<=1)
            {
                [self updateInteractiveTransition:self.progress];
            }
            break;
            
        case UIGestureRecognizerStateEnded:
            self.isInProcess = NO;
            if (self.isComplete)
            {
                [self finishInteractiveTransition];
            }
            else
            {
                [self updateInteractiveTransition:0];
                
                [self cancelInteractiveTransition];
     }
            break;
        default:
            break;
    }
}


//- (void)updateInteractiveTransition:(CGFloat)percentComplete;
//- (void)cancelInteractiveTransition;
//- (void)finishInteractiveTransition;
@end
