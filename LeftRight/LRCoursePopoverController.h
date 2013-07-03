//
//  LRCoursePopoverController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 7/2/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LRViewController;

@interface LRCoursePopoverController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *courses;
@property (nonatomic, strong) LRViewController *viewController;

@property (strong, nonatomic) IBOutlet UIView *tableView;

@end
