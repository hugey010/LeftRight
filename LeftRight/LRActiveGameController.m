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
#import "Hole.h"
#import "LRPlayerPopoverController.h"

@interface LRActiveGameController () {
    Hole *currentHole;
    NSInteger lastPressValue;
    NSInteger lastPressHoleNumber;
    UITextField *currentField;
    
    NSMutableArray *groupedHoles;
    
    NSNumberFormatter *numberFormatter;
    
    UIAlertView *endGameAlert;
    UIAlertView *backButtonAlert;
    
}

@end

@implementation LRActiveGameController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Left Right";
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithTitle:@"End Game" style:UIBarButtonItemStylePlain target:self action:@selector(endGameButtonPressed:)];
    self.navigationItem.rightBarButtonItem = nextButton;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonSystemItemTrash target:self action:@selector(backButtonPressed)];
    
    
    numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [self createAllHoles];
    [self setupHoleArrays];
    
    [self setupHandicaps];
    [self setupNames];
    [self setupHoleObservers];
    
    
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];

    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pressFieldChanged:) name:UITextFieldTextDidChangeNotification object:self.pressField];
}

-(void)dealloc {
    [self removeObservers];
    
    self.course = nil;
    self.playerPopover = nil;
    currentHole = nil;
    currentField = nil;
    groupedHoles = nil;
    numberFormatter = nil;
    
    for (NSInteger i = 1; i <= 18; i++) {
        NSString *keyString = [NSString stringWithFormat:@"hole%ds", i];
        NSArray *array = [self valueForKey:keyString];
        array = nil;
    }
}

- (void)backButtonPressed{
    backButtonAlert = [[UIAlertView alloc] initWithTitle:@"Are you sure you want to end the game?" message:@"This will remove all current round information." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"End Game", nil];
    [backButtonAlert show];
}

- (IBAction)endGameButtonPressed:(id)sender {
    endGameAlert = [[UIAlertView alloc] initWithTitle:@"Are you sure you want to end the game?" message:@"This will remove all current round information." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"End Game", nil];
    [endGameAlert show];
        
}

#pragma mark - UITextFieldDelegate methods


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    if (textField == self.pressField) {
        return;
    }
    
    for (NSArray *holes in groupedHoles) {
        for (UITextField *field in holes) {
            if (field == textField) {
                NSInteger activeIndex = [groupedHoles indexOfObject:holes];
                currentField = textField;
                
                Hole *activeHole = self.course.has_holes[activeIndex];
                
                // some logic for figuring if the current press value should change
                if (lastPressHoleNumber < activeIndex) {
                    activeHole.press = [NSNumber numberWithInteger:lastPressValue];
                }
                
                lastPressValue = [activeHole.press integerValue];
                lastPressHoleNumber = activeIndex;
                
                currentHole = activeHole;
                
                self.pressField.text = [NSString stringWithFormat:@"%@", currentHole.press];

                
                self.currentHoleLabel.text = [NSString stringWithFormat:@"%d", activeIndex+1];
                
                
                // set team buttons
                if ([currentHole.team isEqualToNumber:kTeam1]) {
                    [self.team1Button setTitle:[self.course.has_players[1] name] forState:UIControlStateNormal];
                    
                } else if ([currentHole.team isEqualToNumber:kTeam2]) {
                    [self.team1Button setTitle:[self.course.has_players[2] name] forState:UIControlStateNormal];
                    
                } else if ([currentHole.team isEqualToNumber:kTeam3]) {
                    [self.team1Button setTitle:[self.course.has_players[3] name] forState:UIControlStateNormal];

                }
                
                
                return;
            }
        }
    }

}

#pragma mark - UIAlertViewDelegate methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        if (alertView == endGameAlert) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        } else if (alertView == backButtonAlert) {
            [self.navigationController popViewControllerAnimated:YES];
        }
    } else {
        
    }
}


#pragma mark - Observer methods

-(void)pressFieldChanged:(NSNotification*)notification {
    currentHole.press = [numberFormatter numberFromString:self.pressField.text];
    lastPressHoleNumber = [self.course.has_holes indexOfObject:currentHole];
    lastPressValue = [currentHole.press integerValue];
    [self recalculateAllValues];

}

-(void)inputFieldChanged:(NSNotification*)notification {
    
    

    // player 1 fields
    if (currentField == self.player1Hole1) {
        [self.course.has_holes[0] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole2) {
        [self.course.has_holes[1] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole3) {
        [self.course.has_holes[2] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole4) {
        [self.course.has_holes[3] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole5) {
        [self.course.has_holes[4] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole6) {
        [self.course.has_holes[5] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole7) {
        [self.course.has_holes[6] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole8) {
        [self.course.has_holes[7] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole9) {
        [self.course.has_holes[8] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole10) {
        [self.course.has_holes[9] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole11) {
        [self.course.has_holes[10] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole12) {
        [self.course.has_holes[11] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole13) {
        [self.course.has_holes[12] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole14) {
        [self.course.has_holes[13] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole15) {
        [self.course.has_holes[14] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole16) {
        [self.course.has_holes[15] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole17) {
        [self.course.has_holes[16] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player1Hole18) {
        [self.course.has_holes[17] setPlayer1Score:[numberFormatter numberFromString:currentField.text]];
        
    }
    
    // player 2 fields
    if (currentField == self.player2Hole1) {
        [self.course.has_holes[0] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole2) {
        [self.course.has_holes[1] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole3) {
        [self.course.has_holes[2] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole4) {
        [self.course.has_holes[3] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole5) {
        [self.course.has_holes[4] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole6) {
        [self.course.has_holes[5] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole7) {
        [self.course.has_holes[6] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole8) {
        [self.course.has_holes[7] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole9) {
        [self.course.has_holes[8] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole10) {
        [self.course.has_holes[9] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole11) {
        [self.course.has_holes[10] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole12) {
        [self.course.has_holes[11] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole13) {
        [self.course.has_holes[12] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole14) {
        [self.course.has_holes[13] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole15) {
        [self.course.has_holes[14] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole16) {
        [self.course.has_holes[15] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole17) {
        [self.course.has_holes[16] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player2Hole18) {
        [self.course.has_holes[17] setPlayer2Score:[numberFormatter numberFromString:currentField.text]];
        
    }

    // player 3 fields
    if (currentField == self.player3Hole1) {
        [self.course.has_holes[0] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole2) {
        [self.course.has_holes[1] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole3) {
        [self.course.has_holes[2] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole4) {
        [self.course.has_holes[3] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole5) {
        [self.course.has_holes[4] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole6) {
        [self.course.has_holes[5] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole7) {
        [self.course.has_holes[6] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole8) {
        [self.course.has_holes[7] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole9) {
        [self.course.has_holes[8] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole10) {
        [self.course.has_holes[9] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole11) {
        [self.course.has_holes[10] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole12) {
        [self.course.has_holes[11] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole13) {
        [self.course.has_holes[12] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole14) {
        [self.course.has_holes[13] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole15) {
        [self.course.has_holes[14] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole16) {
        [self.course.has_holes[15] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole17) {
        [self.course.has_holes[16] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player3Hole18) {
        [self.course.has_holes[17] setPlayer3Score:[numberFormatter numberFromString:currentField.text]];
        
    }
    
    // player 4 fields
    if (currentField == self.player4Hole1) {
        [self.course.has_holes[0] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole2) {
        [self.course.has_holes[1] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole3) {
        [self.course.has_holes[2] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole4) {
        [self.course.has_holes[3] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole5) {
        [self.course.has_holes[4] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole6) {
        [self.course.has_holes[5] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole7) {
        [self.course.has_holes[6] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole8) {
        [self.course.has_holes[7] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole9) {
        [self.course.has_holes[8] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole10) {
        [self.course.has_holes[9] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole11) {
        [self.course.has_holes[10] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole12) {
        [self.course.has_holes[11] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole13) {
        [self.course.has_holes[12] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole14) {
        [self.course.has_holes[13] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole15) {
        [self.course.has_holes[14] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole16) {
        [self.course.has_holes[15] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole17) {
        [self.course.has_holes[16] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    } else if (currentField == self.player4Hole18) {
        [self.course.has_holes[17] setPlayer4Score:[numberFormatter numberFromString:currentField.text]];
        
    }
    

    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:@"player1Score"] ||
        [keyPath isEqualToString:@"player2Score"] ||
        [keyPath isEqualToString:@"player3Score"] ||
        [keyPath isEqualToString:@"player4Score"] ||
        [keyPath isEqualToString:@"team"]) {
        
        [self refreshTeamInfo];
        [self.playerPopover dismissPopoverAnimated:YES];
                
        [self recalculateAllValues];
        
    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
    

    
}

-(void) recalculateAllValues {
    
    // calculate out totals
    NSInteger p1Out = 0;
    NSInteger p2Out = 0;
    NSInteger p3Out = 0;
    NSInteger p4Out = 0;

    
    for (NSInteger i = 0; i < 9; i++) {
        p1Out += [[self.course.has_holes[i] player1Score] integerValue];
        p2Out += [[self.course.has_holes[i] player2Score] integerValue];
        p3Out += [[self.course.has_holes[i] player3Score] integerValue];
        p4Out += [[self.course.has_holes[i] player4Score] integerValue];
    }
    self.player1OutLabel.text = [NSString stringWithFormat:@"%d", p1Out];
    self.player2OutLabel.text = [NSString stringWithFormat:@"%d", p2Out];
    self.player3OutLabel.text = [NSString stringWithFormat:@"%d", p3Out];
    self.player4OutLabel.text = [NSString stringWithFormat:@"%d", p4Out];
    
    // calculate in totals
    NSInteger p1In = 0;
    NSInteger p2In = 0;
    NSInteger p3In = 0;
    NSInteger p4In = 0;
    
    
    for (NSInteger i = 9; i < 18; i++) {
        p1In += [[self.course.has_holes[i] player1Score] integerValue];
        p2In += [[self.course.has_holes[i] player2Score] integerValue];
        p3In += [[self.course.has_holes[i] player3Score] integerValue];
        p4In += [[self.course.has_holes[i] player4Score] integerValue];
    }
    self.player1InLabel.text = [NSString stringWithFormat:@"%d", p1In];
    self.player2InLabel.text = [NSString stringWithFormat:@"%d", p2In];
    self.player3InLabel.text = [NSString stringWithFormat:@"%d", p3In];
    self.player4InLabel.text = [NSString stringWithFormat:@"%d", p4In];
    
    // totals
    self.player1TotalLabel.text = [NSString stringWithFormat:@"%d", p1Out + p1In];
    self.player2TotalLabel.text = [NSString stringWithFormat:@"%d", p2Out + p2In];
    self.player3TotalLabel.text = [NSString stringWithFormat:@"%d", p3Out + p3In];
    self.player4TotalLabel.text = [NSString stringWithFormat:@"%d", p4Out + p4In];
    
    
    
    
    // loop for calculations in each hole
    NSInteger p1Points = 0;
    NSInteger p2Points = 0;
    NSInteger p3Points = 0;
    NSInteger p4Points = 0;
    
    for (NSInteger i = 0; i < 18; i++) {
        
        // calculate lowest handicap
        NSInteger p1Handicap = [[self.course.has_players[0] handicap] integerValue];
        NSInteger p2Handicap = [[self.course.has_players[1] handicap] integerValue];
        NSInteger p3Handicap = [[self.course.has_players[2] handicap] integerValue];
        NSInteger p4Handicap = [[self.course.has_players[3] handicap] integerValue];
        
        NSInteger lowestHandicap = MIN(p1Handicap, p2Handicap);
        lowestHandicap = MIN(lowestHandicap, p3Handicap);
        lowestHandicap = MIN(lowestHandicap, p4Handicap);
        
        Hole *hole = self.course.has_holes[i];
        NSInteger holeHandicap = [hole.handicap integerValue];
        
        DLog(@"lowest handicap = %d", lowestHandicap);
        DLog(@"player handicaps = %d, %d, %d, %d", p1Handicap, p2Handicap, p3Handicap, p4Handicap);
        
        NSInteger p1Adjusted = (holeHandicap <= (p1Handicap - lowestHandicap)) ? [hole.player1Score integerValue] -1 : [hole.player1Score integerValue];
        p1Adjusted = p1Adjusted >= 0 ? p1Adjusted : 0;
        
        NSInteger p2Adjusted = (holeHandicap <= (p2Handicap - lowestHandicap)) ? [hole.player2Score integerValue] -1 : [hole.player2Score integerValue];
        p2Adjusted = p2Adjusted >= 0 ? p2Adjusted : 0;
        
        NSInteger p3Adjusted = (holeHandicap <= (p3Handicap - lowestHandicap)) ? [hole.player3Score integerValue] -1 : [hole.player3Score integerValue];
        p3Adjusted = p3Adjusted >= 0 ? p3Adjusted : 0;
        
        NSInteger p4Adjusted = (holeHandicap <= (p4Handicap - lowestHandicap)) ? [hole.player4Score integerValue] -1 : [hole.player4Score integerValue];
        p4Adjusted = p4Adjusted >= 0 ? p4Adjusted : 0;
        
        DLog(@"players adjusted = %d, %d, %d, %d", p1Adjusted, p2Adjusted, p3Adjusted, p4Adjusted);
        
        
        NSInteger teamATotal = 0;
        NSInteger teamBTotal = 0;
        
        if ([hole.team isEqualToNumber:kTeam1]) {
            if (p1Adjusted > p2Adjusted) {
                p2Adjusted *= 10;
            } else {
                p1Adjusted *= 10;
            }
            teamATotal = p1Adjusted + p2Adjusted;
            
            if (p3Adjusted > p4Adjusted) {
                p4Adjusted *= 10;
            } else {
                p3Adjusted *= 10;
            }
            teamBTotal = p3Adjusted + p4Adjusted;
            
        } else if ([hole.team isEqualToNumber:kTeam2]) {
            if (p1Adjusted > p3Adjusted) {
                p3Adjusted *= 10;
            } else {
                p1Adjusted *= 10;
            }
            teamATotal = p3Adjusted + p1Adjusted;
            
            if (p2Adjusted > p4Adjusted) {
                p4Adjusted *= 10;
            } else {
                p2Adjusted *= 10;
            }
            teamBTotal = p4Adjusted + p2Adjusted;
            
        } else if ([hole.team isEqualToNumber:kTeam3]) {
            if (p1Adjusted > p4Adjusted) {
                p4Adjusted *= 10;
            } else {
                p1Adjusted *= 10;
            }
            teamATotal = p4Adjusted + p1Adjusted;
            
            if (p2Adjusted > p3Adjusted) {
                p3Adjusted *= 10;
            } else {
                p2Adjusted *= 10;
            }
            teamBTotal = p3Adjusted + p2Adjusted;
            
        }
        
        DLog(@"team A score = %d", teamATotal);
        DLog(@"team B score = %d", teamBTotal);
        
        NSInteger pointDiff = ABS(teamATotal - teamBTotal) * [hole.press integerValue];

        UILabel *pointsLabel = [self valueForKey:[NSString stringWithFormat:@"pointsLabel%d", i+1]];
        pointsLabel.text = [NSString stringWithFormat:@"%d", pointDiff];
        

        if ([hole.team isEqualToNumber:kTeam1]) {
            if (teamATotal > teamBTotal) {
                p1Points -= pointDiff;
                p2Points -= pointDiff;
                p3Points += pointDiff;
                p4Points += pointDiff;
                
            } else {
                p1Points += pointDiff;
                p2Points += pointDiff;
                p3Points -= pointDiff;
                p4Points -= pointDiff;
            }
            
        } else if ([hole.team isEqualToNumber:kTeam2]) {
            if (teamATotal > teamBTotal) {
                p1Points -= pointDiff;
                p2Points += pointDiff;
                p3Points -= pointDiff;
                p4Points += pointDiff;
                
            } else {
                p1Points += pointDiff;
                p2Points -= pointDiff;
                p3Points += pointDiff;
                p4Points -= pointDiff;
            }
            
        } else if ([hole.team isEqualToNumber:kTeam3]) {
            if (teamATotal > teamBTotal) {
                p1Points -= pointDiff;
                p2Points += pointDiff;
                p3Points += pointDiff;
                p4Points -= pointDiff;
                
            } else {
                p1Points += pointDiff;
                p2Points -= pointDiff;
                p3Points -= pointDiff;
                p4Points += pointDiff;
            }
        }
        
    }
    
    [self.course.has_players[0] setPoints:[NSNumber numberWithInteger:p1Points]];
    [self.course.has_players[1] setPoints:[NSNumber numberWithInteger:p2Points]];
    [self.course.has_players[2] setPoints:[NSNumber numberWithInteger:p3Points]];
    [self.course.has_players[3] setPoints:[NSNumber numberWithInteger:p4Points]];

    self.player1TotalPointLabel.text = [NSString stringWithFormat:@"%@", [self.course.has_players[0] points]];
    self.player2TotalPointLabel.text = [NSString stringWithFormat:@"%@", [self.course.has_players[1] points]];
    self.player3TotalPointLabel.text = [NSString stringWithFormat:@"%@", [self.course.has_players[2] points]];
    self.player4TotalPointLabel.text = [NSString stringWithFormat:@"%@", [self.course.has_players[3] points]];

}

-(void)addObserversToHole:(Hole*)hole {
    [hole addObserver:self forKeyPath:@"player1Score" options:NSKeyValueObservingOptionNew context:nil];
    [hole addObserver:self forKeyPath:@"player2Score" options:NSKeyValueObservingOptionNew context:nil];
    [hole addObserver:self forKeyPath:@"player3Score" options:NSKeyValueObservingOptionNew context:nil];
    [hole addObserver:self forKeyPath:@"player4Score" options:NSKeyValueObservingOptionNew context:nil];
    [hole addObserver:self forKeyPath:@"team" options:NSKeyValueObservingOptionNew context:nil];
    
}

-(void)removeObserversFromHole:(Hole*)hole {
    [hole removeObserver:self forKeyPath:@"player1Score"];
    [hole removeObserver:self forKeyPath:@"player2Score"];
    [hole removeObserver:self forKeyPath:@"player3Score"];
    [hole removeObserver:self forKeyPath:@"player4Score"];
    [hole removeObserver:self forKeyPath:@"team"];

}

#pragma mark - Tear Down

-(void)removeObservers {
    for (NSInteger i = 0; i < 18; i++) {
        Hole *hole = self.course.has_holes[i];
        [self removeObserversFromHole:hole];
    }
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Course Setup

-(void)refreshTeamInfo {
    if ([currentHole.team isEqualToNumber:kTeam1]) {
        [self.team1Button setTitle:[self.course.has_players[1] name] forState:UIControlStateNormal];
        
    } else if ([currentHole.team isEqualToNumber:kTeam2]) {
        [self.team1Button setTitle:[self.course.has_players[2] name] forState:UIControlStateNormal];

    } else if ([currentHole.team isEqualToNumber:kTeam3]) {
        [self.team1Button setTitle:[self.course.has_players[3] name] forState:UIControlStateNormal];

    }
}

-(void)setupHoleObservers {
    for (NSInteger i = 0; i < 18; i++) {
        Hole *hole = self.course.has_holes[i];
        [self addObserversToHole:hole];
    }

}

-(void)setupHoleArrays {
    groupedHoles = [NSMutableArray array];
    
    for (NSInteger holeNo = 0; holeNo < 18; holeNo++) {
        
        NSMutableArray *currentArray = [NSMutableArray array];
        
        for (NSInteger playerNo = 0; playerNo < 4; playerNo++) {
            NSString *holeString = [NSString stringWithFormat:@"player%dHole%d", playerNo+1, holeNo+1];
            UITextField *field = [self valueForKey:holeString];
            
            [currentArray addObject:field];
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(inputFieldChanged:) name:UITextFieldTextDidChangeNotification object:field];

        }
        
        NSString *holeArrayString = [NSString stringWithFormat:@"hole%ds", holeNo+1];
        [self setValue:currentArray forKey:holeArrayString];
        
        groupedHoles[holeNo] = currentArray;
    }
}

-(void)createAllHoles {
    
    for (NSInteger i = 0; i < 18; i++) {
        Hole *hole = self.course.has_holes[i];

        [hole setTeam:kTeam1];
        [hole setPress:@1];
    }
    
    currentHole = self.course.has_holes[0];
    lastPressValue = [currentHole.press integerValue];
    lastPressHoleNumber = 0;
}

-(void)setupHandicaps {
    self.courseHandicap1.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[0] handicap]];
    self.courseHandicap2.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[1] handicap]];
    self.courseHandicap3.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[2] handicap]];
    self.courseHandicap4.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[3] handicap]];
    self.courseHandicap5.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[4] handicap]];
    self.courseHandicap6.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[5] handicap]];
    self.courseHandicap7.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[6] handicap]];
    self.courseHandicap8.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[7] handicap]];
    self.courseHandicap9.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[8] handicap]];
    self.courseHandicap10.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[9] handicap]];
    self.courseHandicap11.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[10] handicap]];
    self.courseHandicap12.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[11] handicap]];
    self.courseHandicap13.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[12] handicap]];
    self.courseHandicap14.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[13] handicap]];
    self.courseHandicap15.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[14] handicap]];
    self.courseHandicap16.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[15] handicap]];
    self.courseHandicap17.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[16] handicap]];
    self.courseHandicap18.text = [NSString stringWithFormat:@"%@", [self.course.has_holes[17] handicap]];
    
    NSArray *players = [self.course.has_players array];
    
    self.player1HandicapLabel.text = [NSString stringWithFormat:@"%@", [players[0] handicap]];
    self.player2HandicapLabel.text = [NSString stringWithFormat:@"%@", [players[1] handicap]];
    self.player3HandicapLabel.text = [NSString stringWithFormat:@"%@", [players[2] handicap]];
    self.player4HandicapLabel.text = [NSString stringWithFormat:@"%@", [players[3] handicap]];
}

-(void)setupNames {
    NSArray *players = [self.course.has_players array];
    
    for (UILabel *l in self.player1NameLabels) {
        l.text = [players[0] name];
    }
    for (UILabel *l in self.player2NameLabels) {
        l.text = [players[1] name];
    }
    for (UILabel *l in self.player3NameLabels) {
        l.text = [players[2] name];
    }
    for (UILabel *l in self.player4NameLabels) {
        l.text = [players[3] name];
    }
    
    [self.team1Button setTitle:[players[1] name] forState:UIControlStateNormal];

}

- (IBAction)team1ButtonPressed:(id)sender {
    
    LRPlayerPopoverController *popover = [self.storyboard instantiateViewControllerWithIdentifier:@"player_popover"];
    popover.hole = currentHole;
    popover.course = self.course;
    self.playerPopover = [[UIPopoverController alloc] initWithContentViewController:popover];
    self.playerPopover.delegate = self;
    
    [self.playerPopover presentPopoverFromRect:self.team1Button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionUp animated:YES];
    [self recalculateAllValues];
    
}
@end
