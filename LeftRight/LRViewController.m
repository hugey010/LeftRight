//
//  LRViewController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/19/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRViewController.h"
#import "Course+LRManagedObject.h"
#import "LRNewGameController.h"
#import "Hole.h"

@interface LRViewController () {
    NSArray *records;
    CGRect initialFrame;
}

@end

@implementation LRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    initialFrame = CGRectZero;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];

    records = [Course MR_findAll];
}

-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UICollectionViewDataSource methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [records count] + 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"course" forIndexPath:indexPath];
    
    
    UILabel *label = (UILabel*)[cell viewWithTag:21];
    
    if (indexPath.row == 0) {
        label.text = @"New Course";
        
    } else {
        Course *course = records[indexPath.row-1];
        label.text = course.name;
        
    }
    
    return cell;
}


#pragma mark - UICollectionViewDelegate methods

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self saveCurrentCourse];
        [self clearFormData];
    } else {
        [self saveCurrentCourse];
        [self clearFormData];
        [self loadFormDataWithCourse:records[indexPath.row-1]];
    }
    
    records = [Course MR_findAll];
    [self.collectionView reloadData];
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

#pragma mark - private methods

-(void)keyboardWillHide:(NSNotification*)n {
    NSDictionary* userInfo = [n userInfo];
    NSTimeInterval duration;
    UIViewAnimationCurve animationCurve;
    CGRect startFrame;
    CGRect endFrame;
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey]    getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]        getValue:&startFrame];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]          getValue:&endFrame];

    
    [UIView animateWithDuration:duration
                          delay:0
                        options:animationCurve|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.view setFrame:initialFrame];
                     }
                     completion:nil];
}

-(void)keyboardWillShow:(NSNotification*)n {
    
    NSDictionary* userInfo = [n userInfo];
    NSTimeInterval duration;
    UIViewAnimationCurve animationCurve;
    CGRect startFrame;
    CGRect endFrame;
    [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] getValue:&duration];
    [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey]    getValue:&animationCurve];
    [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]        getValue:&startFrame];
    [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey]          getValue:&endFrame];
    
    initialFrame = self.view.frame;
    
    CGRect frame = CGRectMake(self.view.frame.origin.x,
                              self.view.frame.origin.y - endFrame.size.height/4,
                              self.view.frame.size.width,
                              self.view.frame.size.height);
    
    [UIView animateWithDuration:duration
                          delay:0
                        options:animationCurve|UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         [self.view setFrame:frame];
                     }
                     completion:nil];
    
    
}

-(Course*)saveCurrentCourse {
    if (self.courseNameField.text && self.courseNameField.text.length > 0) {
        Course *course = [[Course MR_findByAttribute:@"name" withValue:self.courseNameField.text] lastObject];
        
        if (!course) {
            course = [Course MR_createEntity];
        }
        
        
        course.name = self.courseNameField.text;
        [course.has_holes[0] setHandicap:[NSNumber numberWithInteger:[self.holeField1.text integerValue]]];
        [course.has_holes[1] setHandicap:[NSNumber numberWithInteger:[self.holeField2.text integerValue]]];
        [course.has_holes[2] setHandicap:[NSNumber numberWithInteger:[self.holeField3.text integerValue]]];
        [course.has_holes[3] setHandicap:[NSNumber numberWithInteger:[self.holeField4.text integerValue]]];
        [course.has_holes[4] setHandicap:[NSNumber numberWithInteger:[self.holeField5.text integerValue]]];
        [course.has_holes[5] setHandicap:[NSNumber numberWithInteger:[self.holeField6.text integerValue]]];
        [course.has_holes[6] setHandicap:[NSNumber numberWithInteger:[self.holeField7.text integerValue]]];
        [course.has_holes[7] setHandicap:[NSNumber numberWithInteger:[self.holeField8.text integerValue]]];
        [course.has_holes[8] setHandicap:[NSNumber numberWithInteger:[self.holeField9.text integerValue]]];
        [course.has_holes[9] setHandicap:[NSNumber numberWithInteger:[self.holeField10.text integerValue]]];
        [course.has_holes[10] setHandicap:[NSNumber numberWithInteger:[self.holeField11.text integerValue]]];
        [course.has_holes[11] setHandicap:[NSNumber numberWithInteger:[self.holeField12.text integerValue]]];
        [course.has_holes[12] setHandicap:[NSNumber numberWithInteger:[self.holeField13.text integerValue]]];
        [course.has_holes[13] setHandicap:[NSNumber numberWithInteger:[self.holeField14.text integerValue]]];
        [course.has_holes[14] setHandicap:[NSNumber numberWithInteger:[self.holeField15.text integerValue]]];
        [course.has_holes[15] setHandicap:[NSNumber numberWithInteger:[self.holeField16.text integerValue]]];
        [course.has_holes[16] setHandicap:[NSNumber numberWithInteger:[self.holeField17.text integerValue]]];
        [course.has_holes[17] setHandicap:[NSNumber numberWithInteger:[self.holeField18.text integerValue]]];

        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
        
        return course;
    }
    
    return nil;

}

-(void)clearFormData {
    for (UITextField *f in self.allFields) {
        f.text = @"";
    }
    self.courseNameField.text = @"";
}

-(void)loadFormDataWithCourse:(Course*)course {
    
    self.courseNameField.text = course.name;
    self.holeField1.text = [NSString stringWithFormat:@"%@", [course.has_holes[0] handicap]];
    self.holeField2.text = [NSString stringWithFormat:@"%@", [course.has_holes[1] handicap]];
    self.holeField3.text = [NSString stringWithFormat:@"%@", [course.has_holes[2] handicap]];
    self.holeField4.text = [NSString stringWithFormat:@"%@", [course.has_holes[3] handicap]];
    self.holeField5.text = [NSString stringWithFormat:@"%@", [course.has_holes[4] handicap]];
    self.holeField6.text = [NSString stringWithFormat:@"%@", [course.has_holes[5] handicap]];
    self.holeField7.text = [NSString stringWithFormat:@"%@", [course.has_holes[6] handicap]];
    self.holeField8.text = [NSString stringWithFormat:@"%@", [course.has_holes[7] handicap]];
    self.holeField9.text = [NSString stringWithFormat:@"%@", [course.has_holes[8] handicap]];
    self.holeField10.text = [NSString stringWithFormat:@"%@", [course.has_holes[9] handicap]];
    self.holeField11.text = [NSString stringWithFormat:@"%@", [course.has_holes[10] handicap]];
    self.holeField12.text = [NSString stringWithFormat:@"%@", [course.has_holes[11] handicap]];
    self.holeField13.text = [NSString stringWithFormat:@"%@", [course.has_holes[12] handicap]];
    self.holeField14.text = [NSString stringWithFormat:@"%@", [course.has_holes[13] handicap]];
    self.holeField15.text = [NSString stringWithFormat:@"%@", [course.has_holes[14] handicap]];
    self.holeField16.text = [NSString stringWithFormat:@"%@", [course.has_holes[15] handicap]];
    self.holeField17.text = [NSString stringWithFormat:@"%@", [course.has_holes[16] handicap]];
    self.holeField18.text = [NSString stringWithFormat:@"%@", [course.has_holes[17] handicap]];
    
}

- (IBAction)holeField8:(id)sender {
}

- (IBAction)newGameButtonPressed:(id)sender {
    Course *course = [self saveCurrentCourse];
    if ([course isValidCourse]) {
        
        [self.collectionView reloadData];
        
        LRNewGameController *newgame = [self.storyboard instantiateViewControllerWithIdentifier:@"newgame"];
        newgame.course = course;
        [self.navigationController pushViewController:newgame animated:YES];
        
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid Course Values" message:@"Current course must have a name and handicap values between 0 and 9." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil];
        [alert show];
        
    }
    
    
}
@end
