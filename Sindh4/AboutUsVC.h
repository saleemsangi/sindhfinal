//
//  AboutUsVC.h
//  Sindh4
//
//  Created by Saleem Sangi on 9/23/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <MessageUI/MFMessageComposeViewController.h>

@interface AboutUsVC : UIViewController <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *introView;
@property (weak, nonatomic) IBOutlet UIView *englishIntroView;
- (IBAction)infoBtnTapped:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *containerView;

- (IBAction)aboutUsTapped:(id)sender;
@end
