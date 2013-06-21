//
//  LRActiveGameController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/21/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Course;

@interface LRActiveGameController : UIViewController

@property (nonatomic, strong) Course *course;

@property (weak, nonatomic) IBOutlet UILabel *courseHandicap1;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap2;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap3;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap4;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap5;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap6;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap7;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap8;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap9;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap10;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap11;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap12;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap13;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap14;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap15;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap16;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap17;
@property (weak, nonatomic) IBOutlet UILabel *courseHandicap18;

@property (weak, nonatomic) IBOutlet UILabel *pointsLabel1;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel2;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel3;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel4;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel5;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel6;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel7;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel8;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel9;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel10;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel11;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel12;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel13;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel14;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel15;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel16;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel17;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel18;



- (IBAction)backButtonPressed:(id)sender;
- (IBAction)endGameButtonPressed:(id)sender;

@end
