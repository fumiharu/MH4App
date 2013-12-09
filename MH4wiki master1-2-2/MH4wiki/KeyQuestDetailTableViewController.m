//
//  KeyQuestDetailTableViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/04.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "KeyQuestDetailTableViewController.h"
#import "ViewController.h"
#import "SlideMenuViewController.h"
#import "IIViewDeckController.h"
#import "Params.h"

@interface KeyQuestDetailTableViewController ()
{
    NSArray *DataInSection;
    NSArray *param;
    NSArray *KeyQuestDetailData;
    NSArray *sectionTitle;
    NSArray *MainData;
    NSArray *SubData;
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
@property (strong, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation KeyQuestDetailTableViewController
-(void)nadViewDidFinishLoad:(NADView *)adView
{
    NSLog(@"a");
}

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
    
    KeyQuestDetailData = [param valueForKeyPath:@"KeyQuestDetailData"];
    DataInSection = [KeyQuestDetailData valueForKeyPath:@"DataInSection"];
    sectionTitle = [KeyQuestDetailData valueForKeyPath:@"sectionTitle"];
//    NSLog(@"datainsection + %@", DataInSection);
    MainData = [DataInSection valueForKey:@"MainData"];
    SubData = [DataInSection valueForKey:@"SubData"];
    //    ------nend ADNetwork------
//    if ([AdBannerController is4inch]) {
//        self.nadView.frame = CGRectMake(0, 454, 320, 50);
//        self.nadView = [[NADView alloc]initWithFrame:CGRectMake(0, 454, 320, 50)];
//    }else{
////        self.nadView.frame = CGRectMake(0, 366, 320, 50);
//        self.nadView = [[NADView alloc]initWithFrame:CGRectMake(0, 366, 320, 50)];
//    }
//    [self.nadView setIsOutputLog:YES];
//    [self.nadView setNendID:kSetNendID spotID:kSetSpotID];
//    [self.nadView setDelegate:self];
//    [self.nadView load];
//    [self.view addSubview:self.nadView];
    
    [self.navigationItem setTitle:kKeyQuestDetailTableTitle];

    //    ------nend ADNetwork------
    if ([AdBannerController is4inch]) {
        self.nadView = [[NADView alloc]initWithFrame:CGRectMake(0, 454, 320, 50)];
    }else{
        self.nadView = [[NADView alloc]initWithFrame:CGRectMake(0, 366, 320, 50)];
    }
    [self.nadView setIsOutputLog:YES];
    [self.nadView setNendID:kSetNendID spotID:kSetSpotID];
    [self.nadView setDelegate:self];
    [self.nadView load];
    [self.tableView.window insertSubview:self.nadView atIndex:[self.view.subviews count]];
    [super viewDidLoad];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [sectionTitle objectAtIndex:section];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [sectionTitle count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[MainData objectAtIndex:section]count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = [[MainData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [[SubData objectAtIndex:indexPath.section]objectAtIndex:indexPath.row];
//    cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
    cell.textLabel.minimumScaleFactor = 10/20;
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.detailTextLabel.minimumScaleFactor = 10/20;
    cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
    
    return cell;
}

- (void)viewDidUnload {
    [self setTableview:nil];
    [super viewDidUnload];
}
@end
