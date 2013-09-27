//
//  DonateVC.h
//  Sindh4
//
//  Created by Saleem Sangi on 9/24/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DonateVC : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *donateWebView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)donePressed:(id)sender;
@end
