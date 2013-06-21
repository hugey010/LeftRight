//
//  LRNewGameController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/20/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRNewGameController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameField1;
@property (weak, nonatomic) IBOutlet UITextField *nameField2;
@property (weak, nonatomic) IBOutlet UITextField *nameField3;
@property (weak, nonatomic) IBOutlet UITextField *nameField4;

@property (weak, nonatomic) IBOutlet UITextField *handicapField1;
@property (weak, nonatomic) IBOutlet UITextField *handicapField2;
@property (weak, nonatomic) IBOutlet UITextField *handicapField3;
@property (weak, nonatomic) IBOutlet UITextField *handicapField4;

@end
