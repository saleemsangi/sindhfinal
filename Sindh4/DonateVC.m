//
//  DonateVC.m
//  Sindh4
//
//  Created by Saleem Sangi on 9/24/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "DonateVC.h"

@interface DonateVC ()

@end

@implementation DonateVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSURL *websiteUrl = [NSURL URLWithString:@"https://www.paypal.com/cgi-bin/webscr?cmd=_xclick&business=ATL7MC2UUSSCW&lc=US&item_name=Sindhi%20App&button_subtype=services&currency_code=USD&bn=PP%2dBuyNowBF%3abtn_buynowCC_LG%2egif%3aNonHosted"];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:websiteUrl];
    [self.donateWebView loadRequest:urlRequest];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setDonateWebView:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
}
- (IBAction)donePressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)webViewDidStartLoad:(UIWebView *)webView{
    [self.activityIndicator startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.activityIndicator stopAnimating];

}
@end
