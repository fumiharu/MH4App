//
//  WeakPointMonsterDetailTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/03.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "WeakPointMonsterDetailTableViewController.h"
#import "RootDetailCell.h"
#import "Params.h"
@interface WeakPointMonsterDetailTableViewController ()
{
    NSArray *SectionTitle;
    NSArray *DataInSection;
    NSArray *MonsterNameDataInSection;
    NSArray *WeakPointOfMonsterDataInSection;
    NSArray *WeakPointOfMonsterDetailData;
    NSArray *image;
    NSArray *param;
}
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation WeakPointMonsterDetailTableViewController

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
    WeakPointOfMonsterDetailData = [param valueForKeyPath:@"WeakPointOfMonsterDetailData"];
    SectionTitle = [WeakPointOfMonsterDetailData valueForKey:@"SectionTitle"];
    DataInSection = [WeakPointOfMonsterDetailData valueForKey:@"DataInSection"];
    MonsterNameDataInSection = [DataInSection valueForKeyPath:@"MonsterNameDataInSection"];
    WeakPointOfMonsterDataInSection = [DataInSection valueForKeyPath:@"WeakPointOfMonsterDataInSection"];
    image = [DataInSection valueForKeyPath:@"asdd"]; //テスト

    [_tableview registerNib:[UINib nibWithNibName:@"WeakPointOfMonsterDetailCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    [self.navigationItem setTitle:kWeakPointMonsterDetailTableTitle];
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [SectionTitle objectAtIndex:section];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 55;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [SectionTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //セクションの中のデータ数
    return [[MonsterNameDataInSection objectAtIndex:section] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"Cell";
    
    RootDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.MonsterNameLabel.text = [[MonsterNameDataInSection objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.WeakPointOfMonsterLabel.text = [[WeakPointOfMonsterDataInSection objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
    cell.WeakPointOfMonsterImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[[image objectAtIndex:indexPath.section]objectAtIndex:indexPath.row]]]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    code
}

- (void)viewDidUnload {
    [self setTableview:nil];
    [super viewDidUnload];
}
@end
