//
//  LRViewController.h
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/19/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LRViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextView *courseNameView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UITextView *holeField1;
@property (weak, nonatomic) IBOutlet UITextView *holeField2;
@property (weak, nonatomic) IBOutlet UITextView *holeField3;
@property (weak, nonatomic) IBOutlet UITextView *holeField4;
@property (weak, nonatomic) IBOutlet UITextView *holeField5;
@property (weak, nonatomic) IBOutlet UITextView *holeField6;
@property (weak, nonatomic) IBOutlet UITextView *holeField7;
@property (weak, nonatomic) IBOutlet UITextView *holeField8;
@property (weak, nonatomic) IBOutlet UITextView *holeField9;
@property (weak, nonatomic) IBOutlet UITextView *holeField10;
@property (weak, nonatomic) IBOutlet UITextView *holeField11;
@property (weak, nonatomic) IBOutlet UITextView *holeField12;
@property (weak, nonatomic) IBOutlet UITextView *holeField13;
@property (weak, nonatomic) IBOutlet UITextView *holeField14;
@property (weak, nonatomic) IBOutlet UITextView *holeField15;
@property (weak, nonatomic) IBOutlet UITextView *holeField16;
@property (weak, nonatomic) IBOutlet UITextView *holeField17;
@property (weak, nonatomic) IBOutlet UITextView *holeField18;

@property (strong, nonatomic) IBOutletCollection(UITextView) NSArray *holeFields;

- (IBAction)newGameButtonPressed:(id)sender;

@end
