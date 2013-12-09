//
//  AppDelegate.m
//  MH4wiki
//
//  Created by fumiharu on 2013/08/17.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "KeyQuestDetailTableViewController.h"
#import "WeakPointMonsterDetailTableViewController.h"
#import "MixItemDetailTableViewController.h"
#import "SkillDetailTableViewController.h"
#import "IIViewDeckController.h"
#import "SlideMenuViewController.h"
#import <QuartzCore/QuartzCore.h>
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    ------GoogleAnalytics Setup------
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [GAI sharedInstance].dispatchInterval = 20;
    [GAI sharedInstance].debug = YES;
    id<GAITracker> tracker = [[GAI sharedInstance]trackerWithTrackingId:@"UA-43852547-1"];
    [GAI sharedInstance].defaultTracker = tracker;
//    ---------------------------------

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.viewController = [[ViewController alloc] initWithNibName:@"ViewController" bundle:nil];

    UINavigationController *naviView = [[UINavigationController alloc]initWithRootViewController:_viewController];
    SlideMenuViewController *smVC = [[SlideMenuViewController alloc]initWithNibName:@"SlideMenuViewController"
                                                                             bundle:nil];
    UINavigationController *smVC2 = [[UINavigationController alloc]initWithRootViewController:smVC];

//    [smVC2.navigationBar setBackgroundImage:[UIImage imageNamed:@"aa.png"] forBarMetrics:UIBarMetricsDefault];
//    CALayer *layer = smVC2.navigationBar.layer;
//    layer.masksToBounds = NO;
//    layer.shadowOffset = CGSizeMake(3.0f, 3.0f);
//    layer.shadowRadius = 3.0f;
//    layer.shadowOpacity = 10.0f;
    IIViewDeckController *iiVC = [[IIViewDeckController alloc]initWithCenterViewController:naviView
                                                                        leftViewController:smVC2];
    self.window.rootViewController = iiVC;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
