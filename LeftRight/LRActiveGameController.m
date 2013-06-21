//
//  LRActiveGameController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/21/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRActiveGameController.h"
#import "Course.h"
#import "Player.h"

@interface LRActiveGameController ()

@end

@implementation LRActiveGameController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupHandicaps];
    [self setupNames];

}



- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)endGameButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark - Course Setup

-(void)setupHandicaps {
    self.courseHandicap1.text = [NSString stringWithFormat:@"%@", self.course.handicap1];
    self.courseHandicap2.text = [NSString stringWithFormat:@"%@", self.course.handicap2];
    self.courseHandicap3.text = [NSString stringWithFormat:@"%@", self.course.handicap3];
    self.courseHandicap4.text = [NSString stringWithFormat:@"%@", self.course.handicap4];
    self.courseHandicap5.text = [NSString stringWithFormat:@"%@", self.course.handicap5];
    self.courseHandicap6.text = [NSString stringWithFormat:@"%@", self.course.handicap6];
    self.courseHandicap7.text = [NSString stringWithFormat:@"%@", self.course.handicap7];
    self.courseHandicap8.text = [NSString stringWithFormat:@"%@", self.course.handicap8];
    self.courseHandicap9.text = [NSString stringWithFormat:@"%@", self.course.handicap9];
    self.courseHandicap10.text = [NSString stringWithFormat:@"%@", self.course.handicap10];
    self.courseHandicap11.text = [NSString stringWithFormat:@"%@", self.course.handicap11];
    self.courseHandicap12.text = [NSString stringWithFormat:@"%@", self.course.handicap12];
    self.courseHandicap13.text = [NSString stringWithFormat:@"%@", self.course.handicap13];
    self.courseHandicap14.text = [NSString stringWithFormat:@"%@", self.course.handicap14];
    self.courseHandicap15.text = [NSString stringWithFormat:@"%@", self.course.handicap15];
    self.courseHandicap16.text = [NSString stringWithFormat:@"%@", self.course.handicap16];
    self.courseHandicap17.text = [NSString stringWithFormat:@"%@", self.course.handicap17];
    self.courseHandicap18.text = [NSString stringWithFormat:@"%@", self.course.handicap18];
    
    self.player1HandicapLabel.text = [NSString stringWithFormat:@"%@", self.course.player_1.handicap];
    self.player2HandicapLabel.text = [NSString stringWithFormat:@"%@", self.course.player_2.handicap];
    self.player3HandicapLabel.text = [NSString stringWithFormat:@"%@", self.course.player_3.handicap];
    self.player4HandicapLabel.text = [NSString stringWithFormat:@"%@", self.course.player_4.handicap];
}

-(void)setupNames {
    for (UILabel *l in self.player1NameLabels) {
        l.text = self.course.player_1.name;
    }
    for (UILabel *l in self.player2NameLabels) {
        l.text = self.course.player_2.name;
    }
    for (UILabel *l in self.player3NameLabels) {
        l.text = self.course.player_3.name;
    }
    for (UILabel *l in self.player4NameLabels) {
        l.text = self.course.player_4.name;
    }
}

@end
