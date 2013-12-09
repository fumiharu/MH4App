//
//  ArmsCategoryListTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/07.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "ArmsCategoryListTableViewController.h"
#import "ArmsDetailDataTableViewController.h"
#import "Params.h"
@interface ArmsCategoryListTableViewController ()
{
    NSArray *param;
    NSArray *ArmsCategoryList;
    NSArray *ArmsCategoryType;
}
@end

@implementation ArmsCategoryListTableViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam;
{
    self = [super initWithNibName:nibName bundle:nil];
    if (self) {
        param = (NSArray*)aparam;
    }
    return self;
}

- (void)viewDidLoad
{
    ArmsCategoryList = [param valueForKey:@"ArmsCategoryList"];
    ArmsCategoryType = [ArmsCategoryList valueForKey:@"ArmsCategoryType"];
    
    [self.navigationItem setTitle:kArmsCategoryListTableTitle];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ArmsCategoryType count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [ArmsCategoryType objectAtIndex:indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableDictionary *dic = [ArmsCategoryList objectAtIndex:indexPath.row];
    NSLog(@"dic + %@", dic);
    UIViewController *tempCtrl = nil;
    if ([dic[@"ArmsCategoryType"] isEqualToString:@"大剣"] ||
        [dic[@"ArmsCategoryType"] isEqualToString:@"太刀"] ||
        [dic[@"ArmsCategoryType"] isEqualToString:@"片手剣"]) {
        tempCtrl = [[ArmsDetailDataTableViewController alloc]initWithNibName:@"ArmsDetailDataTableViewController"
                                                                      bundle:nil
                                                                       param:dic];
    }
    [self.navigationController pushViewController:tempCtrl animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
