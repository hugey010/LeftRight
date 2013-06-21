//
//  Course.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/21/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Player;

@interface Course : NSManagedObject

@property (nonatomic, retain) NSString * name;
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
@property (nonatomic, retain) Player *player_1;
@property (nonatomic, retain) Player *player_2;
@property (nonatomic, retain) Player *player_3;
@property (nonatomic, retain) Player *player_4;

@end
