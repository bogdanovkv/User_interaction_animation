//
//  NavBarDelegate.m
//  HMW_UserInterAnim
//
//  Created by Константин on 27.11.17.
//  Copyright © 2017 Konstantin. All rights reserved.
//

#import "NavBarDelegate.h"
#import "NavPop.h"
#import "NavPush.h"
#import "Interaction.h"
#import "SecondViewController.h"
@interface NavBarDelegate()
@property (nonatomic, assign) BOOL isPop;
@property (nonatomic, strong) UITapGestureRecognizer *gestRec;

@end

@implementation NavBarDelegate


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC
{
    
    self.isPop = operation == UINavigationControllerOperationPop ? YES : NO;
    
    if([fromVC isKindOfClass:[SecondViewController class]])
    {
    SecondViewController *scv = (SecondViewController*)fromVC;
    self.gestRec = scv.gestRec;
    }
    return operation == UINavigationControllerOperationPush ? [NavPush new] : [NavPop new];
}


- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController
{
    return self.isPop == YES ? [[Interaction alloc ]initWithViewController : navigationController andRecognaiser:self.gestRec] : nil;
}




@end
