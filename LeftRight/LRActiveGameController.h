//
//  LRActiveGameController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/21/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Course;

#define kTeam1 @1
#define kTeam2 @2
#define kTeam3 @3

@interface LRActiveGameController : UIViewController

@property (nonatomic, strong) Course *course;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *player1NameLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *player2NameLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *player3NameLabels;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *player4NameLabels;

@property (weak, nonatomic) IBOutlet UILabel *player1HandicapLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2HandicapLabel;
@property (weak, nonatomic) IBOutlet UILabel *player3HandicapLabel;
@property (weak, nonatomic) IBOutlet UILabel *player4HandicapLabel;

@property (weak, nonatomic) IBOutlet UILabel *player1OutLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2OutLabel;
@property (weak, nonatomic) IBOutlet UILabel *player3OutLabel;
@property (weak, nonatomic) IBOutlet UILabel *player4OutLabel;

@property (weak, nonatomic) IBOutlet UILabel *player1InLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2InLabel;
@property (weak, nonatomic) IBOutlet UILabel *player3InLabel;
@property (weak, nonatomic) IBOutlet UILabel *player4InLabel;

@property (weak, nonatomic) IBOutlet UILabel *player1TotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *player2TotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *player3TotalLabel;
@property (weak, nonatomic) IBOutlet UILabel *player4TotalLabel;

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

@property (weak, nonatomic) IBOutlet UITextField *pressField;


- (IBAction)backButtonPressed:(id)sender;
- (IBAction)endGameButtonPressed:(id)sender;
- (IBAction)previousHoleButtonPressed:(id)sender;
- (IBAction)nextHoleButtonPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *currentHoleLabel;

@end
