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

@interface LRActiveGameController : UIViewController <UITextFieldDelegate>

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

// THE FIELDS
// player 1
@property (weak, nonatomic) IBOutlet UITextField *player1Hole1;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole2;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole3;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole4;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole5;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole6;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole7;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole8;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole9;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole10;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole11;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole12;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole13;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole14;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole15;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole16;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole17;
@property (weak, nonatomic) IBOutlet UITextField *player1Hole18;

// player 2
@property (weak, nonatomic) IBOutlet UITextField *player2Hole1;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole2;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole3;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole4;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole5;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole6;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole7;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole8;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole9;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole10;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole11;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole12;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole13;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole14;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole15;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole16;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole17;
@property (weak, nonatomic) IBOutlet UITextField *player2Hole18;

// player3
@property (weak, nonatomic) IBOutlet UITextField *player3Hole1;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole2;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole3;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole4;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole5;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole6;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole7;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole8;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole9;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole10;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole11;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole12;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole13;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole14;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole15;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole16;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole17;
@property (weak, nonatomic) IBOutlet UITextField *player3Hole18;

// player4
@property (weak, nonatomic) IBOutlet UITextField *player4Hole1;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole2;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole3;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole4;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole5;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole6;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole7;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole8;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole9;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole10;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole11;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole12;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole13;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole14;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole15;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole16;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole17;
@property (weak, nonatomic) IBOutlet UITextField *player4Hole18;

// hole arrays
@property (nonatomic, strong) NSMutableArray *hole1s;
@property (nonatomic, strong) NSMutableArray *hole2s;
@property (nonatomic, strong) NSMutableArray *hole3s;
@property (nonatomic, strong) NSMutableArray *hole4s;
@property (nonatomic, strong) NSMutableArray *hole5s;
@property (nonatomic, strong) NSMutableArray *hole6s;
@property (nonatomic, strong) NSMutableArray *hole7s;
@property (nonatomic, strong) NSMutableArray *hole8s;
@property (nonatomic, strong) NSMutableArray *hole9s;
@property (nonatomic, strong) NSMutableArray *hole10s;
@property (nonatomic, strong) NSMutableArray *hole11s;
@property (nonatomic, strong) NSMutableArray *hole12s;
@property (nonatomic, strong) NSMutableArray *hole13s;
@property (nonatomic, strong) NSMutableArray *hole14s;
@property (nonatomic, strong) NSMutableArray *hole15s;
@property (nonatomic, strong) NSMutableArray *hole16s;
@property (nonatomic, strong) NSMutableArray *hole17s;
@property (nonatomic, strong) NSMutableArray *hole18s;


@property (weak, nonatomic) IBOutlet UIButton *team1Button;
@property (weak, nonatomic) IBOutlet UIButton *team2Button;
@property (weak, nonatomic) IBOutlet UIButton *team3Button;
- (IBAction)team1ButtonPressed:(id)sender;
- (IBAction)team2ButtonPressed:(id)sender;
- (IBAction)team3ButtonPressed:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *pressField;


- (IBAction)backButtonPressed:(id)sender;
- (IBAction)endGameButtonPressed:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *currentHoleLabel;

@end
