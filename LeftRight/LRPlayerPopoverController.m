//
//  LRPlayerPopoverController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/30/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRPlayerPopoverController.h"
#import "LRActiveGameController.h"
#import "Hole.h"
#import "Course.h"
#import "Player.h"

@interface LRPlayerPopoverController ()

@end

@implementation LRPlayerPopoverController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.playerButton1 setTitle:[self.course.has_players[1] name] forState:UIControlStateNormal];
    [self.playerButton2 setTitle:[self.course.has_players[2] name] forState:UIControlStateNormal];
    [self.playerButton3 setTitle:[self.course.has_players[3] name] forState:UIControlStateNormal];

}


- (IBAction)player2ButtonPressed:(id)sender {
    self.hole.team = kTeam1;
    
}

- (IBAction)player3ButtonPressed:(id)sender {
    self.hole.team = kTeam2;

}

- (IBAction)player4ButtonPressed:(id)sender {
    self.hole.team = kTeam3;

}
@end
