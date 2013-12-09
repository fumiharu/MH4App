//
//  SkillDetailTableViewController.h
//  MH4wiki
//
//  Created by fumiharu on 2013/09/03.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillDetailTableViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource>
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam;
@property (strong, nonatomic) IBOutlet UITableView *tableview;

@end
