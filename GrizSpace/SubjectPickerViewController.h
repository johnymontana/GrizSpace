//
//  SubjectPickerViewController.h
//  GrizSpace
//
//  Created by William Lyon on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DBAccess.h"
#import "ClassPickerViewController.h"
#import "SelectCourseTableViewController.h"


@interface SubjectPickerViewController : UITableViewController
{
    NSMutableArray *copyListOfItems;
    BOOL searching;
    BOOL letUserSelectRow;
    IBOutlet UISearchBar *searchBar;
}

@property (nonatomic, strong) NSArray *subjects;
//@property (nonatomic, strong) UISearchBar *searchBar;
@end
