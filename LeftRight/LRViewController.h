//
//  LRViewController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/19/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Course;

@interface LRViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate, UIPopoverControllerDelegate>

@property (nonatomic, strong) UIPopoverController *coursePopover;

@property (weak, nonatomic) IBOutlet UITextField *courseNameField;
@property (weak, nonatomic) IBOutlet UITextField *holeField1;
@property (weak, nonatomic) IBOutlet UITextField *holeField2;
@property (weak, nonatomic) IBOutlet UITextField *holeField3;
@property (weak, nonatomic) IBOutlet UITextField *holeField4;
@property (weak, nonatomic) IBOutlet UITextField *holeField5;
@property (weak, nonatomic) IBOutlet UITextField *holeField6;
@property (weak, nonatomic) IBOutlet UITextField *holeField7;
@property (weak, nonatomic) IBOutlet UITextField *holeField8;
@property (weak, nonatomic) IBOutlet UITextField *holeField9;
@property (weak, nonatomic) IBOutlet UITextField *holeField10;
@property (weak, nonatomic) IBOutlet UITextField *holeField11;
@property (weak, nonatomic) IBOutlet UITextField *holeField12;
@property (weak, nonatomic) IBOutlet UITextField *holeField13;
@property (weak, nonatomic) IBOutlet UITextField *holeField14;
@property (weak, nonatomic) IBOutlet UITextField *holeField15;
@property (weak, nonatomic) IBOutlet UITextField *holeField16;
@property (weak, nonatomic) IBOutlet UITextField *holeField17;
@property (weak, nonatomic) IBOutlet UITextField *holeField18;

@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *allFields;

@property (weak, nonatomic) IBOutlet UIButton *currentCourseButton;
- (IBAction)currentCourseButtonPressed:(id)sender;

- (IBAction)newGameButtonPressed:(id)sender;

-(Course*)saveCurrentCourse;
-(void)clearFormData;
-(void)loadFormDataWithCourse:(Course*)course;


@end
