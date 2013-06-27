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

@interface LRActiveGameController () {
    Hole *currentHole;
    UITextField *currentField;
    NSInteger activeIndex;
    
    NSMutableArray *groupedHoles;
    
    NSNumberFormatter *numberFormatter;

}

@end

@implementation LRActiveGameController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    [self createAllHoles];
    [self setupHoleArrays];
    
    [self setupHandicaps];
    [self setupNames];
    [self setupHoleObservers];
    


}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    
}

- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)endGameButtonPressed:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
    
    // TODO: add this to history
}

#pragma mark - UITextFieldDelegate methods


-(void)textFieldDidBeginEditing:(UITextField *)textField {
    
    for (NSArray *holes in groupedHoles) {
        for (UITextField *field in holes) {
            if (field == textField) {
                activeIndex = [groupedHoles indexOfObject:holes];
                currentField = textField;
                currentHole = self.course.has_holes[activeIndex];
                self.currentHoleLabel.text = [NSString stringWithFormat:@"%d", activeIndex];
                
                
                // set team buttons
                if ([currentHole.team isEqualToNumber:kTeam1]) {
                    [self resetHoleButtonsExcept:self.team1Button];
                    
                } else if ([currentHole.team isEqualToNumber:kTeam2]) {
                    [self resetHoleButtonsExcept:self.team2Button];
                    
                } else if ([currentHole.team isEqualToNumber:kTeam3]) {
                    [self resetHoleButtonsExcept:self.team3Button];
                    
                }
                
                // set press value
                self.pressField.text = [NSString stringWithFormat:@"%@", currentHole.press];
                
                
                return;
            }
        }
    }

}
 

#pragma mark - Observer methods

-(void)inputFieldChanged:(NSNotification*)notification {

    if (currentField == self.pressField) {
        currentHole.press = [numberFormatter numberFromString:currentField.text];
    }
    // player 1 fields
    else if (currentField == self.player1Hole1) {
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
    DLog(@" ahole changed");
    // recalculate all values
    
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

#pragma mark - Course Setup

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
    NSMutableOrderedSet *set = [NSMutableOrderedSet orderedSet];
    for (NSInteger i = 0; i < 18; i++) {
        Hole *hole = [Hole MR_createEntity];
        hole.team = kTeam1;
        hole.press = @1;
        set[i] = hole;
        [self addObserversToHole:hole];
    }
    
    self.course.has_holes = set;
    
    currentHole = set[0];
    [self resetHoleButtonsExcept:self.team1Button];
}

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
    [self.team2Button setTitle:[players[2] name] forState:UIControlStateNormal];
    [self.team3Button setTitle:[players[3] name] forState:UIControlStateNormal];

}

- (IBAction)team1ButtonPressed:(id)sender {
    currentHole.team = kTeam1;
    [self resetHoleButtonsExcept:sender];
}

- (IBAction)team2ButtonPressed:(id)sender {
    currentHole.team = kTeam2;
    [self resetHoleButtonsExcept:sender];
}

- (IBAction)team3ButtonPressed:(id)sender {
    currentHole.team = kTeam3;
    [self resetHoleButtonsExcept:sender];
}

-(void)resetHoleButtonsExcept:(UIButton*)button {
    [self.team1Button setBackgroundImage:nil forState:UIControlStateNormal];
    [self.team2Button setBackgroundImage:nil forState:UIControlStateNormal];
    [self.team3Button setBackgroundImage:nil forState:UIControlStateNormal];
    
    [button setBackgroundImage:[UIImage imageNamed:@"red_rectangle.jpg"] forState:UIControlStateNormal];

    
}
@end
