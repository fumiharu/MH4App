//
//  MixItemDetailTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/01.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "MixItemDetailTableViewController.h"
#import "RootDetailCell.h"
#import "Params.h"

@interface MixItemDetailTableViewController ()
{
    NSArray *MixItemList;
    NSArray *MixItemDetailData;
    NSArray *MixItemDetailSectionTitle;
    NSArray *MixItemDetailDataInSection;
    NSArray *MixedItemResultDataInSection;
    NSArray *MixedItemResultUp;
    NSArray *MixedItemResultSuccess;
    NSArray *MixedItemDataInSection;
    NSArray *param;
    NSDictionary *dic;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation MixItemDetailTableViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam 
{
    self = [super initWithNibName:nibName bundle:bundle];
    if (self) {
        param = (NSArray*)aparam;
    }
    return self;
}

- (void)viewDidLoad
{
    MixItemList = [param valueForKeyPath:@"MixItemList"];
    MixItemDetailData = [MixItemList valueForKeyPath:@"MixItemDetailData"];
    MixItemDetailSectionTitle = [MixItemDetailData valueForKeyPath:@"MixItemDetailSectionTitle"];
    MixItemDetailDataInSection = [MixItemDetailData valueForKeyPath:@"MixItemDetailDataInSection"];
    MixedItemResultDataInSection = [MixItemDetailDataInSection valueForKeyPath:@"MixedItemResultDataInSection"];
    MixedItemResultUp = [MixItemDetailDataInSection valueForKey:@"MixedItemResultUp"];
    MixedItemDataInSection = [MixItemDetailDataInSection valueForKey:@"MixedItemDataInSection"];
    MixedItemResultSuccess = [MixItemDetailDataInSection valueForKey:@"MixedItemResultSuccess"];
    [_tableview registerNib:[UINib nibWithNibName:@"MixItemDetailCell" bundle:nil]forCellReuseIdentifier:@"Cell"];
    
    [self.navigationItem setTitle:kMixItemDetailTableTitle];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [MixItemDetailSectionTitle objectAtIndex:section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [MixItemDetailSectionTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[MixedItemResultDataInSection objectAtIndex:section]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    RootDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.MixedItemResultSuccess.text = [[MixedItemResultSuccess objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.MixedItemResultUp.text = [[MixedItemResultUp objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.MixedItemResultDataInSection.text = [[MixedItemResultDataInSection objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.MixedItemDataInSection.text = [[MixedItemDataInSection objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //code
}
- (void)viewDidUnload {
         [self setTableview:nil];
         [super viewDidUnload];
     }
@end
