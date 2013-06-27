//
//  Hole.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/27/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Course;

@interface Hole : NSManagedObject

@property (nonatomic, retain) NSNumber * player1Score;
@property (nonatomic, retain) NSNumber * player2Score;
@property (nonatomic, retain) NSNumber * player3Score;
@property (nonatomic, retain) NSNumber * player4Score;
@property (nonatomic, retain) NSNumber * press;
@property (nonatomic, retain) NSNumber * team;
@property (nonatomic, retain) NSNumber * team1Points;
@property (nonatomic, retain) NSNumber * team2Points;
@property (nonatomic, retain) NSNumber * handicap;
@property (nonatomic, retain) NSOrderedSet *in_course;
@end

@interface Hole (CoreDataGeneratedAccessors)

- (void)insertObject:(Course *)value inIn_courseAtIndex:(NSUInteger)idx;
- (void)removeObjectFromIn_courseAtIndex:(NSUInteger)idx;
- (void)insertIn_course:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeIn_courseAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInIn_courseAtIndex:(NSUInteger)idx withObject:(Course *)value;
- (void)replaceIn_courseAtIndexes:(NSIndexSet *)indexes withIn_course:(NSArray *)values;
- (void)addIn_courseObject:(Course *)value;
- (void)removeIn_courseObject:(Course *)value;
- (void)addIn_course:(NSOrderedSet *)values;
- (void)removeIn_course:(NSOrderedSet *)values;
@end
