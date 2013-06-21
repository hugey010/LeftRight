//
//  Course+LRManagedObject.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/20/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "Course+LRManagedObject.h"

@implementation Course (LRManagedObject)

-(BOOL)isValidCourse {
    return ([self isValidHoleField:self.handicap1]
            && [self isValidHoleField:self.handicap2]
            && [self isValidHoleField:self.handicap3]
            && [self isValidHoleField:self.handicap4]
            && [self isValidHoleField:self.handicap5]
            && [self isValidHoleField:self.handicap6]
            && [self isValidHoleField:self.handicap7]
            && [self isValidHoleField:self.handicap8]
            && [self isValidHoleField:self.handicap9]
            && [self isValidHoleField:self.handicap10]
            && [self isValidHoleField:self.handicap11]
            && [self isValidHoleField:self.handicap12]
            && [self isValidHoleField:self.handicap13]
            && [self isValidHoleField:self.handicap14]
            && [self isValidHoleField:self.handicap15]
            && [self isValidHoleField:self.handicap16]
            && [self isValidHoleField:self.handicap17]
            && [self isValidHoleField:self.handicap18]
            && self.name.length > 0);
}

-(BOOL)isValidHoleField:(NSNumber*)field {
    NSInteger value = [field integerValue];
    if (value >= 0 && value <= 9) {
        return YES;
    } else {
        return NO;
    }
}

@end
