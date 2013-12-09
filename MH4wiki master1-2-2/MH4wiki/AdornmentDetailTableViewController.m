//
//  AdornmentDetailTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/08.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "AdornmentDetailTableViewController.h"
#import "RootDetailCell.h"
@interface AdornmentDetailTableViewController ()
{
    NSArray *param;
    NSArray *AdornmentName;
    NSArray *AdornmentEffect;
    NSArray *AdornmentSlot;
    NSArray *AdornmentMaterial0;
    NSArray *AdornmentMaterial1;
    
    NSArray *AdornmentDetailList;
    NSArray *AdornmentSectionTitle;
    NSArray *AdornmentDetailDataInSection;
}
@end

@implementation AdornmentDetailTableViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam
{
    self = [super initWithNibName:nibName bundle:nil];
    if (self) {
        param = (NSArray*)aparam;
    }
    return self;
}

- (void)viewDidLoad
{
    AdornmentDetailList = [param valueForKey:@"AdornmentDetailList"];
    AdornmentSectionTitle = [AdornmentDetailList valueForKey:@"AdornmentSectionTitle"];
//    NSLog(@"AdornmentSectionTitle+ %@", AdornmentSectionTitle);
    AdornmentDetailDataInSection = [AdornmentDetailList valueForKey:@"AdornmentDetailDataInSection"];
    AdornmentName = [AdornmentDetailDataInSection valueForKey:@"AdornmentName"];
    NSLog(@"ADDDDDDD+ %@", AdornmentName);
    AdornmentEffect = [AdornmentDetailDataInSection valueForKey:@"AdornmentEffect"];
    AdornmentSlot = [AdornmentDetailDataInSection valueForKey:@"AdornmentSlot"];
    AdornmentMaterial0 = [AdornmentDetailDataInSection valueForKey:@"AdornmentMaterial0"];
    AdornmentMaterial1 = [AdornmentDetailDataInSection valueForKey:@"AdornmentMaterial1"];
    
        [_tableview registerNib:[UINib nibWithNibName:@"AdornmentDetailCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [AdornmentSectionTitle objectAtIndex:section];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [AdornmentSectionTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[AdornmentName objectAtIndex:section]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    RootDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.AdornmentName.text = [[AdornmentName objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
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
}

- (void)viewDidUnload {
    [self setTableview:nil];
    [super viewDidUnload];
}
@end
