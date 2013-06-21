//
//  LRNewGameController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/20/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRNewGameController.h"
#import "Course.h"

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
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return NO; // We do not want UITextField to insert line-breaks.
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)startGameButtonPressed:(id)sender {
}

@end
