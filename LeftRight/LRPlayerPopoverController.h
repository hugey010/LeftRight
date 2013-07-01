//
//  LRPlayerPopoverController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/30/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Hole;
@class Course;

@interface LRPlayerPopoverController : UIViewController

@property (nonatomic, strong) Hole *hole;
@property (nonatomic, strong) Course *course;
@property (weak, nonatomic) IBOutlet UIButton *playerButton1;
@property (weak, nonatomic) IBOutlet UIButton *playerButton2;
@property (weak, nonatomic) IBOutlet UIButton *playerButton3;

- (IBAction)player2ButtonPressed:(id)sender;
- (IBAction)player3ButtonPressed:(id)sender;
- (IBAction)player4ButtonPressed:(id)sender;


@end
