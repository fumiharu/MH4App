//
//  SlideMenuViewController.h
//  MH4wiki
//
//  Created by fumiharu on 2013/09/04.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlideMenuViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, NSURLConnectionDataDelegate, NADViewDelegate>
{
    NSMutableData *mutData;
    NSMutableArray *mutableArray;
    NSURLConnection *connection;
    NSString *label;
    NSUserDefaults *UD;
    NSString *filePath;
    NSDictionary *dictionary;
    UIActivityIndicatorView *indicator;
    UIView *backgroundAlpha;
    UINavigationController *naviView;
}
//@property (weak, nonatomic) IBOutlet ADBannerView *adBannerP;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *updateInfo;
@property (retain, nonatomic)NADView *nadView;
- (IBAction)pressButton:(id)sender;
-(void)getDataFile;
@end
