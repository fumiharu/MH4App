//
//  SlideMenuViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/04.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "SlideMenuViewController.h"
#import "ViewController.h"
#import "RootDetailCell.h"
#import "KeyQuestDetailTableViewController.h"
#import "MixItemDetailTableViewController.h"
#import "SkillDetailTableViewController.h"
#import "WeakPointMonsterDetailTableViewController.h"
#import "IIViewDeckController.h"
#import "ArmsCategoryListTableViewController.h"
#import "Params.h"
#import "MapListTableViewController.h"
#import "UpdateInfoViewController.h"
#import "AdornmentDetailTableViewController.h"
@interface SlideMenuViewController ()
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
@end

@implementation SlideMenuViewController
-(void)nadViewDidFinishLoad:(NADView *)adView
{
    NSLog(@"nend finish");
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}


- (void)viewDidLoad
{
    _tableView.dataSource = self;
    _tableView.delegate = self;
    if (floor(NSFoundationVersionNumber) > NSFoundationVersionNumber_iOS_6_1) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
//  ----reload button----
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                          target:self
                                                                                         action:@selector(viewDidLoad)];
//  ----loading Layer----
    backgroundAlpha = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 426)];
    backgroundAlpha.backgroundColor = [UIColor blackColor];
    backgroundAlpha.alpha = 0.5;
    [self.view addSubview:backgroundAlpha];

//  ----add ActivityIndicatorView-----
    indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    float w = indicator.frame.size.width;
    float h = indicator.frame.size.height;
    float x = self.view.frame.size.width/2 - w/2;
    float y = self.view.frame.size.height/2 - h/2;
    indicator.frame = CGRectMake(x, y, w, h);

    [indicator startAnimating];
    [self.view addSubview:indicator];

//  ----add BackGroundImage----
    _tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"b.jpg"]];
    _tableView.backgroundColor = [UIColor clearColor];
    
//  Connecting Server
    NSURL *url = [NSURL URLWithString:kDataSource];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    connection = [NSURLConnection connectionWithRequest:req delegate:self];
    if (connection) {
        mutData = [[NSMutableData alloc]init];
    }
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
    [self.view addSubview:self.nadView];

    [super viewDidLoad];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self.nextResponder touchesBegan:touches withEvent:event];
//    [super touchesBegan:touches withEvent:event];
//    UIAlertView *a1 = [[UIAlertView alloc]initWithTitle:@"in"
//                                                message:@"in"
//                                               delegate:nil
//                                      cancelButtonTitle:@"no" otherButtonTitles:nil];
//    [a1 show];
//    [self.nadView removeFromSuperview];
//}
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
//    UIAlertView *a1 = [[UIAlertView alloc]initWithTitle:@"out"
//                                                message:@"out"
//                                               delegate:nil
//                                      cancelButtonTitle:@"no" otherButtonTitles:nil];
//    [a1 show];
//    [self.view addSubview:self.nadView];
//}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    //mutData to Dictionary
    NSDictionary *allDataDictionary = [NSJSONSerialization JSONObjectWithData:mutData options:0 error:nil];
    //    NSLog(@"mutData + %@", [allDataDictionary objectForKey:@"Root"]);
    //path at /HomeDirectory/sample0.plist
    filePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"sample.plist"];
    //    NSLog(@"filepath+%@", filePath);
    //Write at /HomeDirectory/sample0.plist
    [allDataDictionary writeToFile:filePath atomically: YES];
    //Read at /HomeDirectory/sample0.plist
    NSDictionary *testt = [NSDictionary dictionaryWithContentsOfURL:[NSURL fileURLWithPath:filePath]];
    NSDictionary *feed = testt[@"Root"];
    
    mutableArray = [NSMutableArray arrayWithArray:feed[@"SecondRoot"]];
    NSLog(@"1*%@", allDataDictionary);
    NSLog(@"2*%@", mutableArray);
    [_tableView reloadData];
    [indicator stopAnimating];

    [backgroundAlpha removeFromSuperview];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =[_tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSDictionary *obj = [mutableArray objectAtIndex:indexPath.row];
    cell.textLabel.text = obj[@"Label"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableDictionary *obj = [mutableArray objectAtIndex:indexPath.row];
    UIViewController *tempCtrl = nil;
    if ([obj[@"Label"] isEqualToString:kKeyQuestDetailTableTitle]){
        tempCtrl = [[KeyQuestDetailTableViewController alloc]initWithNibName:@"KeyQuestDetailTableViewController"
                                                                      bundle:nil
                                                                       param:obj];
    }else if ([obj[@"Label"] isEqualToString:@"モンスター弱点リスト"]){
        tempCtrl = [[WeakPointMonsterDetailTableViewController alloc]initWithNibName:@"WeakPointMonsterDetailTableViewController"
                                                                              bundle:nil
                                                                               param:obj];
    }else if ([obj[@"Label"] isEqualToString:kMixItemDetailTableTitle]){
        tempCtrl = [[MixItemDetailTableViewController alloc]initWithNibName:@"MixItemDetailTableViewController"
                                                                     bundle:nil
                                                                      param:obj];
    }else if ([obj[@"Label"] isEqualToString:kSkillDetailTableTitle]){
        tempCtrl =[[SkillDetailTableViewController alloc]initWithNibName:@"SkillDetailTableViewController"
                                                                  bundle:nil
                                                                   param:obj];
    }else if ([obj[@"Label"] isEqualToString:kArmsCategoryListTableTitle]){
        tempCtrl = [[ArmsCategoryListTableViewController alloc]initWithNibName:@"ArmsCategoryListTableViewController"
                                                                        bundle:nil
                                                                         param:obj];
    }else if ([obj[@"Label"] isEqualToString:kUpdateListTitle]){
        tempCtrl = [[UpdateInfoViewController alloc]initWithNibName:@"UpdateInfoViewController"
                                                             bundle:nil
                                                              param:obj];
//        [self.viewDeckController presentModalViewController:tempCtrl animated:YES];
    }else if ([obj[@"Label"] isEqualToString:kMapListTableTitle]){        
        tempCtrl = [[MapListTableViewController alloc]initWithNibName:@"MapListTableViewController"
                                                               bundle:nil
                                                                param:obj];
    }else if ([obj[@"Label"] isEqualToString:@"装飾品リスト"]){
        tempCtrl = [[AdornmentDetailTableViewController alloc]initWithNibName:@"AdornmentDetailTableViewController"
                                                              bundle:nil
                                                               param:obj];
        
    }
    naviView = [[UINavigationController alloc]initWithRootViewController:tempCtrl];

    //  -----Button Tap To SideMenu-----
    tempCtrl.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"menu"
                                                                                style:UIBarButtonItemStylePlain
                                                                           target:self.viewDeckController
                                                                           action:@selector(toggleLeftView)];

    if (self.viewDeckController.centerController) {
        self.viewDeckController.centerController = naviView;
        if ([tempCtrl.nibName isEqual:@"MapListTableViewController"]) {
            UIBarButtonItem *BtnSpace0 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            UIBarButtonItem *OpenTableView = [[UIBarButtonItem alloc]initWithTitle:@"infoooooooo"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:nil
                                                                            action:nil];
            UIBarButtonItem *BtnSpace1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
            naviView.navigationBar.topItem.rightBarButtonItems = [NSArray arrayWithObjects:BtnSpace0,OpenTableView, BtnSpace1, nil];
        }
    }
    [self.viewDeckController closeLeftViewBouncing:^(IIViewDeckController *controller) {
//    [self.viewDeckController rightViewPushViewControllerOverCenterController:tempCtrl];
     //                [[NSNotificationCenter defaultCenter]postNotificationName:@"SlideMenuData"
//                                                           object:self
//                                                         userInfo:obj];
    }];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];    
}
-(IBAction)pressButton:(id)sender {
    // get Homedirectory
    NSString *homeDir = NSHomeDirectory();
    //create FileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    NSArray *list = [fileManager contentsOfDirectoryAtPath:homeDir
                                                     error:&error];
    //display at file and directory list
    for (NSString *path in list) {
        NSLog(@"%@", path);
    }
}
//  -----Button Tap getJsonFile-----


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [mutData setLength:0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [mutData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    UIAlertView *ua = [[UIAlertView alloc]initWithTitle:@"通信に失敗しました."
                                                message:@"電波状況を確認し, リロードして下さい."
                                               delegate:nil
                                      cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [ua show];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [mutableArray count];
}

//- (void)viewDidUnload {
//    [self setTableview:nil];
//    [super viewDidUnload];
//}

//-(void)didReceiveMemoryWarning{
//    [super didReceiveMemoryWarning];
//}

@end
