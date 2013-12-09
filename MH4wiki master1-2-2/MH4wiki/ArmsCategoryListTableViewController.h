//
//  ArmsCategoryListTableViewController.h
//  MH4wiki
//
//  Created by fumiharu on 2013/09/07.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ArmsCategoryListTableViewController : UITableViewController
<UITableViewDelegate,UITableViewDataSource>
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam;
@end
