//
//  UpdateInfoViewController.m
//  MH4wiki
//
//  Created by fumiharu on 2013/09/07.
//  Copyright (c) 2013年 FumiharuSugawara. All rights reserved.
//

#import "UpdateInfoViewController.h"
#import "Params.h"
@interface UpdateInfoViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webview;

@end

@implementation UpdateInfoViewController

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)bundle param:(NSMutableDictionary *)aparam
{
    self = [super initWithNibName:nibName bundle:nil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [self.navigationItem setTitle:kUpdateListTitle];
    NSURL *url = [NSURL URLWithString:kUpdatePageURL];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [self.webview loadRequest:req];
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)viewDidUnload {
    [self setWebview:nil];
    [super viewDidUnload];
}
@end
