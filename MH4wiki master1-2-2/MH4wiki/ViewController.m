//
//  ViewController.m
//  MH4wiki
//
//     Created by fumiharu on 2013/08/17.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "ViewController.h"
#import "IIViewDeckController.h"

@interface ViewController ()

@end

@implementation ViewController
-(void)nadViewDidFinishLoad:(NADView *)adView{
    NSLog(@"a");
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    self.view.alpha = 0.5;
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.view.alpha = 0;
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    UIAlertView *ua = [[UIAlertView alloc]initWithTitle:@"失敗"
                                                message:@"失敗しました"
                                               delegate:self
                                      cancelButtonTitle:@"no"
                                      otherButtonTitles:nil];
    [ua show];
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

- (void)viewDidLoad
{
    const float version = [[[UIDevice currentDevice] systemVersion] floatValue];
    NSLog(@"version+ %f", version);

    [self.viewDeckController toggleLeftView];
    view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 416)];
    view.backgroundColor = [UIColor blackColor];
    view.alpha = 0.5;
//    [self.view addSubview:view];
//    ------nend ADNetwork------
//    if ([AdBannerController is4inch]) {
//        self.nadView = [[NADView alloc]initWithFrame:CGRectMake(0, 454, 320, 50)];
//    }else{
//        self.nadView = [[NADView alloc]initWithFrame:CGRectMake(0, 366, 320, 50)];
//    }
//    [self.nadView setIsOutputLog:YES];
//    [self.nadView setNendID:@"a6eca9dd074372c898dd1df549301f277c53f2b9" spotID:@"3172"];
//    [self.nadView setDelegate:self];
//    [self.nadView load];
//    [self.view addSubview:self.nadView];
    
    [super viewDidLoad];
}



//-(IBAction)pressButton:(id)sender {
//    // get Homedirectory
//    NSString *homeDir = NSHomeDirectory();
//    //create FileManager
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    NSError *error;
//    NSArray *list = [fileManager contentsOfDirectoryAtPath:homeDir
//                                                     error:&error];
//    //display at file and directory list
//    for (NSString *path in list) {
//        NSLog(@"%@", path);
//    }
//}
@end