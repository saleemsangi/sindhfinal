//
//  NewsPaperDetailVC.h
//  Sindh4
//
//  Created by Saleem Sangi on 7/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPaperDetailVC : UIViewController <UIWebViewDelegate>

@property(nonatomic) NSUInteger selectedCell;
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end
