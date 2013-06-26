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
    
    
    NSInteger activeIndex = 0;
    
    for (NSArray *holes in groupedHoles) {
        for (UITextField *field in holes) {
            if (field == textField) {
                activeIndex = [groupedHoles indexOfObject:holes];
                currentField = textField;
                goto loopEnd;
            }
        }
    }
    loopEnd:;
    
    currentHole = self.course.has_holes[activeIndex];
    
    self.currentHoleLabel.text = [NSString stringWithFormat:@"%d", activeIndex];
    
     
    
}
 


-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSString *appendString = [NSString stringWithFormat:@"%@%@", textField.text, string];
    
    
    if (textField == self.player1Hole1) {
        currentHole.player1Score = [numberFormatter numberFromString:appendString];
    }
    
    /*
    for (NSArray *holes in groupedHoles) {
        for (NSInteger i = 0; i < 4; i++) {
            UITextField *field = holes[i];
            if (field == textField) {
                
                
                
                
                goto loopEnd;
            }
            
            
        }
    }
    loopEnd:;
     */
    
    return appendString.length <= 2;
}
 

#pragma mark - Observer methods

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    DLog(@" ahole changed");
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
            NSString *holeString = [NSString stringWithFormat:@"player%dHole%d", 1, holeNo+1];
            UITextField *field = [self valueForKey:holeString];
            
            [currentArray addObject:field];

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
}

@end
