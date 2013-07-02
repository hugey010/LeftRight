//
//  Hole.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 7/1/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Hole : NSManagedObject

@property (nonatomic, retain) NSNumber * handicap;
@property (nonatomic, retain) NSNumber * player1Score;
@property (nonatomic, retain) NSNumber * player2Score;
@property (nonatomic, retain) NSNumber * player3Score;
@property (nonatomic, retain) NSNumber * player4Score;
@property (nonatomic, retain) NSNumber * press;
@property (nonatomic, retain) NSNumber * team;
@property (nonatomic, retain) NSNumber * team1Points;
@property (nonatomic, retain) NSNumber * team2Points;
@property (nonatomic, retain) Course *in_course;

@end
