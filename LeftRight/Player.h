//
//  Player.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/27/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSNumber * handicap;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * points;
@property (nonatomic, retain) Course *in_course;

@end
