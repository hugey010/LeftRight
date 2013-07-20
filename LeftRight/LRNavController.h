//
//  LRNavController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 7/19/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRNavController : UINavigationController

-(void)toggleNextButtonWithText:(NSString*)text toPushViewController:(UIViewController*)vc;

@end
