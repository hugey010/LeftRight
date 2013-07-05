//
//  LRCoursePopoverController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 7/2/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRCoursePopoverController.h"
#import "Course+LRManagedObject.h"
#import "LRViewController.h"

@interface LRCoursePopoverController ()

@end

@implementation LRCoursePopoverController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

#pragma mark - UITableViewDataSource methods

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 66;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.courses count] + 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"course_cell" forIndexPath:indexPath];
    
    
    UILabel *label = (UILabel*)[cell viewWithTag:21];

    if (indexPath.row == 0) {
        label.text = @"New Course";
        
    } else {
        Course *course = self.courses[indexPath.row-1];
        label.text = course.name;
        
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.viewController saveCurrentCourse];
    [self.viewController clearFormData];
    
    if (indexPath.row != 0) {
        [self.viewController loadFormDataWithCourse:self.courses[indexPath.row-1]];
    }
    
    [self.viewController.coursePopover dismissPopoverAnimated:YES];
    
}

@end
