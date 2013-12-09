//
//  ArmsDetailDataTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/07.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "ArmsDetailDataTableViewController.h"
#import "RootDetailCell.h"
#import "Params.h"
@interface ArmsDetailDataTableViewController ()
{
    NSArray *param;
    NSArray *ArmsCategoryType;
    NSArray *ArmsCategoryList;
    NSArray *ArmsDetailData;
    NSArray *ArmsName;
    NSArray *ArmsPrice;
    NSArray *ArmsPower;
    NSArray *ArmsSpecific;
    NSArray *ArmsMaterial0;
    NSArray *ArmsMaterial1;
    NSArray *ArmsSharpnessImage;
    NSArray *ArmsGreatDamage;
    NSArray *ArmsSlot;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ArmsDetailDataTableViewController

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
    
    ArmsDetailData = [param valueForKey:@"ArmsDetailData"];
    ArmsName = [ArmsDetailData valueForKey:@"ArmsName"];
    ArmsPrice = [ArmsDetailData valueForKey:@"ArmsPrice"];
    ArmsPower = [ArmsDetailData valueForKey:@"ArmsPower"];
    ArmsSpecific = [ArmsDetailData valueForKey:@"ArmsSpecific"];
    ArmsMaterial0 = [ArmsDetailData valueForKey:@"ArmsMaterial0"];
    ArmsMaterial1 = [ArmsDetailData valueForKey:@"ArmsMaterial1"];
    ArmsSharpnessImage = [ArmsDetailData valueForKey:@"ArmsSharpnessImage"];
    ArmsGreatDamage = [ArmsDetailData valueForKey:@"ArmsGreatDamage"];
    ArmsSlot = [ArmsDetailData valueForKey:@"ArmsSlot"];

    [_tableview registerNib:[UINib nibWithNibName:@"Arms-0DetailCell" bundle:nil] forCellReuseIdentifier:@"Cell"];

    [self.navigationItem setTitle:kArmsDetailDataTableTitle];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 73;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [ArmsName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    RootDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    NSDictionary *dic = [ArmsGreatDamage objectAtIndex:indexPath.row];
    cell.ArmsName.text = [ArmsName objectAtIndex:indexPath.row];
    cell.ArmsPrice.text = [ArmsPrice objectAtIndex:indexPath.row];
    cell.ArmsPower.text = [ArmsPower objectAtIndex:indexPath.row];
    cell.ArmsSlot.text = [ArmsSlot objectAtIndex:indexPath.row];
    cell.ArmsSpecific.text = [ArmsSpecific objectAtIndex:indexPath.row];
    cell.ArmsMaterial0.text = [ArmsMaterial0 objectAtIndex:indexPath.row];
    cell.ArmsMaterial1.text = [ArmsMaterial1 objectAtIndex:indexPath.row];
    cell.ArmsGreatDamage.text = [ArmsGreatDamage objectAtIndex:indexPath.row];
//    cell.ArmsSharpnessImage.image = 
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    return cell;
    }

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIAlertView *ua = [[UIAlertView alloc]initWithTitle:@"aho"
//                                                message:@"asd"
//                                               delegate:nil
//                                      cancelButtonTitle:@"no"
//                                      otherButtonTitles:nil];
//    [ua show];
}

- (void)viewDidUnload {
    [self setTableview:nil];
    [super viewDidUnload];
}
@end
