//
//  LRNavController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 7/19/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRNavController.h"

@interface LRNavController () {
    UIViewController *nextPush;
}

@end

@implementation LRNavController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBar.tintColor = [UIColor colorWithRed:119.0/255.0 green:145.0/255.0 blue:66.0/255.0 alpha:1.0];

}

-(void)toggleNextButtonWithText:(NSString*)text toPushViewController:(UIViewController*)vc {
    
    nextPush = vc;

    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:text style:UIBarButtonItemStylePlain target:self action:@selector(nextButtonPressed)];
    self.navigationItem.rightBarButtonItem = nextButton;
}

-(void)nextButtonPressed {
    [self pushViewController:nextPush animated:YES];
}

@end
