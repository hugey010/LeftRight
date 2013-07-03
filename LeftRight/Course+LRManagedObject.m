//
//  Course+LRManagedObject.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/20/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "Course+LRManagedObject.h"
#import "Hole.h"

@implementation Course (LRManagedObject)

-(BOOL)isValidCourse {
    return ([self isValidHoleField:[self.has_holes[0] handicap]]
            && [self isValidHoleField:[self.has_holes[1] handicap]]
            && [self isValidHoleField:[self.has_holes[2] handicap]]
            && [self isValidHoleField:[self.has_holes[3] handicap]]
            && [self isValidHoleField:[self.has_holes[4] handicap]]
            && [self isValidHoleField:[self.has_holes[5] handicap]]
            && [self isValidHoleField:[self.has_holes[6] handicap]]
            && [self isValidHoleField:[self.has_holes[7] handicap]]
            && [self isValidHoleField:[self.has_holes[8] handicap]]
            && [self isValidHoleField:[self.has_holes[9] handicap]]
            && [self isValidHoleField:[self.has_holes[10] handicap]]
            && [self isValidHoleField:[self.has_holes[11] handicap]]
            && [self isValidHoleField:[self.has_holes[12] handicap]]
            && [self isValidHoleField:[self.has_holes[13] handicap]]
            && [self isValidHoleField:[self.has_holes[14] handicap]]
            && [self isValidHoleField:[self.has_holes[15] handicap]]
            && [self isValidHoleField:[self.has_holes[16] handicap]]
            && [self isValidHoleField:[self.has_holes[17] handicap]]
            && self.name.length > 0);
}

-(BOOL)isValidHoleField:(NSNumber*)field {
    NSInteger value = [field integerValue];
    if (value >= 0 && value <= 18) {
        return YES;
    } else {
        return NO;
    }
}

@end
