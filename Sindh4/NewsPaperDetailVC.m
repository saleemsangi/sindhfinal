//
//  NewsPaperDetailVC.m
//  Sindh4
//
//  Created by Saleem Sangi on 7/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "NewsPaperDetailVC.h"

@interface NewsPaperDetailVC ()

@end

@implementation NewsPaperDetailVC
@synthesize selectedCell = _selectedCell;
@synthesize activityIndicator = _activityIndicator, webView = _webView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        // 1  http://www.awamiawaz.net
        //2 http://halchaldaily.com
        // 3 http://www.dailyhilal.com
        // 4 http://www.dailyibrat.com/
        // 5 www.thekawish.com
        // 6 http://dailymehran.net
        // 7 http://dailytameer-e-sindh.com/
        // 8 http://www.dailynijat.com.pk
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"cell = %i", _selectedCell);
    NSString *urlString = nil;
    
    switch (self.selectedCell) {
        case 0:
            urlString = @"http://www.awamiawaz.net";
            break;
        case 1:
            urlString = @"http://halchaldaily.com";
            break;
        case 2:
            urlString = @"http://www.dailyhilal.com";
            break;
        case 3:
            urlString = @"http://www.dailyibrat.com/";
            break;
        case 4:
            urlString = @"http://www.thekawish.com";
            break;
        case 5:
            urlString = @"http://dailymehran.net";
            break;
        case 6:
            urlString = @"http://dailytameer-e-sindh.com/";
            break;
        case 7:
            urlString = @"http://www.dailynijat.com.pk";
            break;
            
        default:
            break;
    }
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:urlRequest];
    
}

#pragma mark webView Delegate

- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activityIndicator startAnimating];
}


- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [_activityIndicator stopAnimating];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [_activityIndicator stopAnimating];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
