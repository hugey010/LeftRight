//
//  LRNewGameController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/20/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRNewGameController.h"
#import "Course.h"
#import "LRActiveGameController.h"

@interface LRNewGameController ()

@end

@implementation LRNewGameController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.courseLabel.text = self.course.name;
    
}

#pragma mark - UITextFieldDelegate methods

-(BOOL)textFieldShouldReturn:(UITextField*)textField;
{
    NSInteger nextTag = textField.tag + 1;
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    
    if (nextResponder) {
        [nextResponder becomeFirstResponder];
        
    } else {
        [textField resignFirstResponder];
        
    }
    
    return NO;
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)startGameButtonPressed:(id)sender {
}

@end
