//
//  SkillDetailTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/03.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "SkillDetailTableViewController.h"
#import "RootDetailCell.h"
#import "Params.h"
@interface SkillDetailTableViewController ()
{
    NSArray *param;
    NSArray *SkillDetailList;
    NSArray *SkillDetailListSectionTitle;
    NSArray *SkillDetailDataInSection;
    NSArray *SkillDetailDataTitle;
    NSArray *SkillDetailDataList;
    
    NSArray *SkillName0;
    NSArray *SkillName1;
    NSArray *SkillName2;
    NSArray *SkillName3;
    NSArray *SkillName4;
    NSArray *SkillName5;
    NSArray *TriggeredPointOfSkill0;
    NSArray *TriggeredPointOfSkill1;
    NSArray *TriggeredPointOfSkill2;
    NSArray *TriggeredPointOfSkill3;
    NSArray *TriggeredPointOfSkill4;
    NSArray *TriggeredPointOfSkill5;
    NSArray *EffectiveSkill0;
    NSArray *EffectiveSkill1;
    NSArray *EffectiveSkill2;
    NSArray *EffectiveSkill3;
    NSArray *EffectiveSkill4;
    NSArray *EffectiveSkill5;
    NSDictionary *dic;
}
@end

@implementation SkillDetailTableViewController

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
    SkillDetailList = [param valueForKey:@"SkillDetailList"];
    SkillDetailListSectionTitle = [SkillDetailList valueForKey:@"SkillDetailListSectionTitle"];
    SkillDetailDataInSection = [SkillDetailList valueForKey:@"SkillDetailDataInSection"];
    SkillDetailDataTitle = [SkillDetailDataInSection valueForKey:@"SkillDetailDataTitle"];
    SkillDetailDataList = [SkillDetailDataInSection valueForKey:@"SkillDetailDataList"];
//    NSLog(@"skillName+%@", SkillDetailDataList);
    SkillName0 = [SkillDetailDataList valueForKey:@"SkillName0"];
    NSLog(@"skillName+%@", SkillName0);
    SkillName1 = [SkillDetailDataList valueForKey:@"SkillName1"];
    SkillName2 = [SkillDetailDataList valueForKey:@"SkillName2"];
    SkillName3 = [SkillDetailDataList valueForKey:@"SkillName3"];
    SkillName4 = [SkillDetailDataList valueForKey:@"SkillName4"];
    SkillName5 = [SkillDetailDataList valueForKey:@"SkillName5"];
    TriggeredPointOfSkill0 = [SkillDetailDataList valueForKey:@"TriggeredPointOfSkill0"];
    TriggeredPointOfSkill1 = [SkillDetailDataList valueForKey:@"TriggeredPointOfSkill1"];
    TriggeredPointOfSkill2 = [SkillDetailDataList valueForKey:@"TriggeredPointOfSkill2"];
    TriggeredPointOfSkill3 = [SkillDetailDataList valueForKey:@"TriggeredPointOfSkill3"];
    TriggeredPointOfSkill4 = [SkillDetailDataList valueForKey:@"TriggeredPointOfSkill4"];
    TriggeredPointOfSkill5 = [SkillDetailDataList valueForKey:@"TriggeredPointOfSkill5"];
    EffectiveSkill0 = [SkillDetailDataList valueForKey:@"EffectiveSkill0"];
    EffectiveSkill1 = [SkillDetailDataList valueForKey:@"EffectiveSkill1"];
    EffectiveSkill2 = [SkillDetailDataList valueForKey:@"EffectiveSkill2"];
    EffectiveSkill3 = [SkillDetailDataList valueForKey:@"EffectiveSkill3"];
    EffectiveSkill4 = [SkillDetailDataList valueForKey:@"EffectiveSkill4"];
    EffectiveSkill5 = [SkillDetailDataList valueForKey:@"EffectiveSkill5"];
    
    [_tableview registerNib:[UINib nibWithNibName:@"SkillDetailCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [self.navigationItem setTitle:kSkillDetailTableTitle];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 335;
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [SkillDetailListSectionTitle objectAtIndex:section];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [SkillDetailListSectionTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[SkillDetailDataTitle objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    RootDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.SkillName0.text = [[SkillName0 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.SkillName1.text = [[SkillName1 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.SkillName2.text = [[SkillName2 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.SkillName3.text = [[SkillName3 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.SkillName4.text = [[SkillName4 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.SkillName5.text = [[SkillName5 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.TriggeredPointOfSkill0.text = [[TriggeredPointOfSkill0 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.TriggeredPointOfSkill1.text = [[TriggeredPointOfSkill1 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.TriggeredPointOfSkill2.text = [[TriggeredPointOfSkill2 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.TriggeredPointOfSkill3.text = [[TriggeredPointOfSkill3 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.TriggeredPointOfSkill4.text = [[TriggeredPointOfSkill4 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.TriggeredPointOfSkill5.text = [[TriggeredPointOfSkill5 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.SkillDetailDataTitle.text = [[SkillDetailDataTitle objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.EffectiveSkill0.text = [[EffectiveSkill0 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.EffectiveSkill1.text = [[EffectiveSkill1 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.EffectiveSkill2.text = [[EffectiveSkill2 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.EffectiveSkill3.text = [[EffectiveSkill3 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.EffectiveSkill4.text = [[EffectiveSkill4 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.EffectiveSkill5.text = [[EffectiveSkill5 objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //dode
}
- (void)viewDidUnload {
    [self setTableview:nil];
    [self setTableview:nil];
    [super viewDidUnload];
}
@end
