//
//  KeyQuestDetailTableViewController.h
//  MH4wiki
//
//  Created by fumiharu on 2013/09/04.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KeyQuestDetailTableViewController : UITableViewController
<UITableViewDelegate, UITableViewDataSource, NADViewDelegate>
- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam;
@property (retain, nonatomic)NADView *nadView;
@end
