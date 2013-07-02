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
#import "Player.h"

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
    if ([self checkAllFields]) {
        
        
        Player *p1 = [Player MR_createEntity];
        p1.name = self.nameField1.text;
        p1.handicap = [NSNumber numberWithInteger:[self.handicapField1.text integerValue]];
        
        Player *p2 = [Player MR_createEntity];
        p2.name = self.nameField2.text;
        p2.handicap = [NSNumber numberWithInteger:[self.handicapField2.text integerValue]];
        
        Player *p3 = [Player MR_createEntity];
        p3.name = self.nameField3.text;
        p3.handicap = [NSNumber numberWithInteger:[self.handicapField3.text integerValue]];
        
        Player *p4 = [Player MR_createEntity];
        p4.name = self.nameField4.text;
        p4.handicap = [NSNumber numberWithInteger:[self.handicapField4.text integerValue]];
        
        self.course.has_players = [NSOrderedSet orderedSetWithArray:@[p1, p2, p3, p4]];
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

        
        self.activeGame = [self.storyboard instantiateViewControllerWithIdentifier:@"active"];
        self.activeGame.course = self.course;
        [self.navigationController pushViewController:self.activeGame animated:YES];
        
        
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Missing Fields" message:@"Please fill in all player names and handicaps." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
    }
}

-(BOOL)checkAllFields {
    for (UITextField *field in self.allFields) {
        if (!field || field.text.length < 1) {
            return NO;
        }
    }
    return YES;
}

@end
