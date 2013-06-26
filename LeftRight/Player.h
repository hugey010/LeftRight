//
//  Player.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/25/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSNumber * handicap;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * score1;
@property (nonatomic, retain) NSNumber * score2;
@property (nonatomic, retain) NSNumber * score3;
@property (nonatomic, retain) NSNumber * score4;
@property (nonatomic, retain) NSNumber * score5;
@property (nonatomic, retain) NSNumber * score6;
@property (nonatomic, retain) NSNumber * score7;
@property (nonatomic, retain) NSNumber * score8;
@property (nonatomic, retain) NSNumber * score9;
@property (nonatomic, retain) NSNumber * score10;
@property (nonatomic, retain) NSNumber * score11;
@property (nonatomic, retain) NSNumber * score12;
@property (nonatomic, retain) NSNumber * score13;
@property (nonatomic, retain) NSNumber * score14;
@property (nonatomic, retain) NSNumber * score15;
@property (nonatomic, retain) NSNumber * score16;
@property (nonatomic, retain) NSNumber * score17;
@property (nonatomic, retain) NSNumber * score18;
@property (nonatomic, retain) Course *in_course;

@end
