//
//  LRViewController.m
//  LeftRight
//
//  Created by Tyler Hugenberg on 6/19/13.
//  Copyright (c) 2013 Hugey. All rights reserved.
//

#import "LRViewController.h"
#import "Course.h"

@interface LRViewController () {
    NSArray *records;
}

@end

@implementation LRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    records = [Course MR_findAll];
}

#pragma mark - UICollectionViewDataSource methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [records count] + 1;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"course" forIndexPath:indexPath];
    
    
    UILabel *label = (UILabel*)[cell viewWithTag:21];
    
    if (indexPath.row == 0) {
        label.text = @"New Course";
        
    } else {
        Course *course = records[indexPath.row-1];
        label.text = course.name;
        
    }
    
    return cell;
}


#pragma mark - UICollectionViewDelegate methods

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self saveCurrentCourse];
        [self clearFormData];
    } else {
        [self saveCurrentCourse];
        [self clearFormData];
        [self loadFormDataWithCourse:records[indexPath.row-1]];
    }
    
    records = [Course MR_findAll];
    DLog(@"records = %@", records);
    [self.collectionView reloadData];
}

#pragma mark - private methods

-(void)saveCurrentCourse {
    if (self.courseNameView.text && self.courseNameView.text.length > 0) {
        Course *course = [[Course MR_findByAttribute:@"name" withValue:self.courseNameView.text] lastObject];
        
        if (!course) {
            course = [Course MR_createEntity];
        }
        
        course.name = self.courseNameView.text;
        course.handicap1 = [NSNumber numberWithInteger:[self.holeField1.text integerValue]];
        course.handicap2 = [NSNumber numberWithInteger:[self.holeField2.text integerValue]];
        course.handicap3 = [NSNumber numberWithInteger:[self.holeField3.text integerValue]];
        course.handicap4 = [NSNumber numberWithInteger:[self.holeField4.text integerValue]];
        course.handicap5 = [NSNumber numberWithInteger:[self.holeField5.text integerValue]];
        course.handicap6 = [NSNumber numberWithInteger:[self.holeField6.text integerValue]];
        course.handicap7 = [NSNumber numberWithInteger:[self.holeField7.text integerValue]];
        course.handicap8 = [NSNumber numberWithInteger:[self.holeField8.text integerValue]];
        course.handicap9 = [NSNumber numberWithInteger:[self.holeField9.text integerValue]];
        course.handicap10 = [NSNumber numberWithInteger:[self.holeField10.text integerValue]];
        course.handicap11 = [NSNumber numberWithInteger:[self.holeField11.text integerValue]];
        course.handicap12 = [NSNumber numberWithInteger:[self.holeField12.text integerValue]];
        course.handicap13 = [NSNumber numberWithInteger:[self.holeField13.text integerValue]];
        course.handicap14 = [NSNumber numberWithInteger:[self.holeField14.text integerValue]];
        course.handicap15 = [NSNumber numberWithInteger:[self.holeField15.text integerValue]];
        course.handicap16 = [NSNumber numberWithInteger:[self.holeField16.text integerValue]];
        course.handicap17 = [NSNumber numberWithInteger:[self.holeField17.text integerValue]];
        course.handicap18 = [NSNumber numberWithInteger:[self.holeField18.text integerValue]];
        
        [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreAndWait];
    }

}

-(void)clearFormData {
    for (UITextField *f in self.holeFields) {
        f.text = @"";
    }
    self.courseNameView.text = @"";
}

-(void)loadFormDataWithCourse:(Course*)course {
    
    self.courseNameView.text = course.name;
    self.holeField1.text = [NSString stringWithFormat:@"%@", course.handicap1];
    self.holeField2.text = [NSString stringWithFormat:@"%@", course.handicap2];
    self.holeField3.text = [NSString stringWithFormat:@"%@", course.handicap3];
    self.holeField4.text = [NSString stringWithFormat:@"%@", course.handicap4];
    self.holeField5.text = [NSString stringWithFormat:@"%@", course.handicap5];
    self.holeField6.text = [NSString stringWithFormat:@"%@", course.handicap6];
    self.holeField7.text = [NSString stringWithFormat:@"%@", course.handicap7];
    self.holeField8.text = [NSString stringWithFormat:@"%@", course.handicap8];
    self.holeField9.text = [NSString stringWithFormat:@"%@", course.handicap9];
    self.holeField10.text = [NSString stringWithFormat:@"%@", course.handicap10];
    self.holeField11.text = [NSString stringWithFormat:@"%@", course.handicap11];
    self.holeField12.text = [NSString stringWithFormat:@"%@", course.handicap12];
    self.holeField13.text = [NSString stringWithFormat:@"%@", course.handicap13];
    self.holeField14.text = [NSString stringWithFormat:@"%@", course.handicap14];
    self.holeField15.text = [NSString stringWithFormat:@"%@", course.handicap15];
    self.holeField16.text = [NSString stringWithFormat:@"%@", course.handicap16];
    self.holeField17.text = [NSString stringWithFormat:@"%@", course.handicap17];
    self.holeField18.text = [NSString stringWithFormat:@"%@", course.handicap18];
    
}

- (IBAction)newGameButtonPressed:(id)sender {
}
@end
