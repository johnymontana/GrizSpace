

//
//  SelectCourseTableViewController.m
//  GrizSpace
//
//  Created by William Lyon on 3/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SelectCourseTableViewController.h"

@interface SelectCourseTableViewController ()

@end

@implementation SelectCourseTableViewController
@synthesize cancelButton;
@synthesize courses = _courses;
@synthesize selectedSubject;
@synthesize delegate;


-(void)setCourses:(NSMutableArray *)courses
{
    _courses = courses;
}



-(IBAction)cancelButtonClicked:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CourseMapper* cm = [[CourseMapper alloc] init];
    self.courses = [cm findBySubject:selectedSubject];
    
    NSLog(@"Number of courses: %d", [self.courses count]);
}

- (void)viewDidUnload
{
    [self setCancelButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

/*
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}
*/


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.courses count];
}





- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Course";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Configure the cell...

    CourseModel* current = [self.courses objectAtIndex:indexPath.row];
    cell.textLabel.text = [current getTitle];
  //  NSLog([[self.courses objectAtIndex:indexPath.row] subject]);
          
    cell.detailTextLabel.text = [[self.courses objectAtIndex:indexPath.row] getShortName];
    return cell;
}




/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
/*- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        //[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
        [CourseList removeCourse: [self.courses objectAtIndex:indexPath.row]];
        
        [self viewDidLoad];
        [tableView reloadData];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    
    //[delegate didReceiveCourse:[self.courses objectAtIndex:indexPath.row]];
    //[self dismissModalViewControllerAnimated:YES];
    
    SelectSectionTableViewController *sectionPicker = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectSectionTableViewController"];
    
    [sectionPicker setSelectedCourse:[self.courses objectAtIndex:indexPath.row]];
    [sectionPicker setSelectedSubject:self.selectedSubject];
    [self.navigationController pushViewController:sectionPicker animated:YES];
}


@end
