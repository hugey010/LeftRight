//
//  Course.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/25/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Hole, Player;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSNumber * handicap1;
@property (nonatomic, retain) NSNumber * handicap2;
@property (nonatomic, retain) NSNumber * handicap3;
@property (nonatomic, retain) NSNumber * handicap4;
@property (nonatomic, retain) NSNumber * handicap5;
@property (nonatomic, retain) NSNumber * handicap6;
@property (nonatomic, retain) NSNumber * handicap7;
@property (nonatomic, retain) NSNumber * handicap8;
@property (nonatomic, retain) NSNumber * handicap9;
@property (nonatomic, retain) NSNumber * handicap10;
@property (nonatomic, retain) NSNumber * handicap11;
@property (nonatomic, retain) NSNumber * handicap12;
@property (nonatomic, retain) NSNumber * handicap13;
@property (nonatomic, retain) NSNumber * handicap14;
@property (nonatomic, retain) NSNumber * handicap15;
@property (nonatomic, retain) NSNumber * handicap16;
@property (nonatomic, retain) NSNumber * handicap17;
@property (nonatomic, retain) NSNumber * handicap18;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSOrderedSet *has_holes;
@property (nonatomic, retain) NSOrderedSet *has_players;
@end

@interface Course (CoreDataGeneratedAccessors)

- (void)insertObject:(Hole *)value inHas_holesAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHas_holesAtIndex:(NSUInteger)idx;
- (void)insertHas_holes:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHas_holesAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHas_holesAtIndex:(NSUInteger)idx withObject:(Hole *)value;
- (void)replaceHas_holesAtIndexes:(NSIndexSet *)indexes withHas_holes:(NSArray *)values;
- (void)addHas_holesObject:(Hole *)value;
- (void)removeHas_holesObject:(Hole *)value;
- (void)addHas_holes:(NSOrderedSet *)values;
- (void)removeHas_holes:(NSOrderedSet *)values;
- (void)insertObject:(Player *)value inHas_playersAtIndex:(NSUInteger)idx;
- (void)removeObjectFromHas_playersAtIndex:(NSUInteger)idx;
- (void)insertHas_players:(NSArray *)value atIndexes:(NSIndexSet *)indexes;
- (void)removeHas_playersAtIndexes:(NSIndexSet *)indexes;
- (void)replaceObjectInHas_playersAtIndex:(NSUInteger)idx withObject:(Player *)value;
- (void)replaceHas_playersAtIndexes:(NSIndexSet *)indexes withHas_players:(NSArray *)values;
- (void)addHas_playersObject:(Player *)value;
- (void)removeHas_playersObject:(Player *)value;
- (void)addHas_players:(NSOrderedSet *)values;
- (void)removeHas_players:(NSOrderedSet *)values;
@end
