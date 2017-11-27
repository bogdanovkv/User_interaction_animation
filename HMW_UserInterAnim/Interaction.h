//
//  Interaction.h
//  HMW_UserInterAnim
//
//  Created by Константин on 27.11.17.
//  Copyright © 2017 Konstantin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Interaction : UIPercentDrivenInteractiveTransition
-(instancetype)initWithViewController: (UINavigationController*) viewController andRecognaiser: (UITapGestureRecognizer*) recognaiser;
@end
