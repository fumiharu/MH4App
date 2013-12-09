//
//  ViewController.h
//  MH4wiki
//
//  Created by fumiharu on 2013/08/17.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, NSURLConnectionDataDelegate, UIWebViewDelegate, NADViewDelegate>
{
    NSMutableData *mutData;
    NSMutableArray *mutableArray;
    NSURLConnection *connection;
    NSString *label;
    NSUserDefaults *UD;
    NSString *filePath;
    NSDictionary *dictionary;
    UIView *view;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *updateInfo;
@property (retain, nonatomic)NADView *nadView;
- (IBAction)pressButton:(id)sender;
@end
