//
//  AboutUsVC.m
//  Sindh4
//
//  Created by Saleem Sangi on 9/23/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "AboutUsVC.h"
#import <QuartzCore/QuartzCore.h>


@interface AboutUsVC ()
{
    bool a;

}
@end

@implementation AboutUsVC

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
    a = YES;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    self.introView.layer.cornerRadius = 10;
    self.introView.layer.masksToBounds = YES;
    
    self.englishIntroView.layer.cornerRadius = 10;
    self.englishIntroView.layer.masksToBounds = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)infoBtnTapped:(id)sender {
    
//    if (a == NO) {
//        [UIView transitionFromView:self.introView toView:self.englishIntroView
//                          duration:1.0
//                           options:UIViewAnimationOptionTransitionFlipFromLeft
//                        completion:NULL];
//        a = YES; // a = !a;
//    }
//    else {
//        [UIView transitionFromView:self.englishIntroView toView:self.introView
//                          duration:1.0
//                           options:UIViewAnimationOptionTransitionFlipFromLeft
//                        completion:NULL];
//        a = NO; // a = !a;
//    }
    
    [UIView transitionWithView:self.containerView
                      duration:1.0
                       options:(a ? UIViewAnimationOptionTransitionFlipFromRight :
                                UIViewAnimationOptionTransitionFlipFromLeft)
                    animations: ^{
                        if(a)
                        {
                            self.englishIntroView.hidden = true;
                            self.introView.hidden = false;
                        }
                        else
                        {
                            self.englishIntroView.hidden = false;
                            self.introView.hidden = true;
                        }
                    }
     
                    completion:^(BOOL finished) {
                        if (finished) {
                            a = !a;
                        }
                    }];
}

- (IBAction)aboutUsTapped:(id)sender {
    
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
        mailViewController.mailComposeDelegate = self;
        [mailViewController setSubject:@"Sindhi App Recommendation"];
        NSArray *usersTo = [NSArray arrayWithObject: @"sangi.saleem@gmail.com"];
        [mailViewController setToRecipients:usersTo];
        [self presentModalViewController:mailViewController animated:YES];
        
    }
    
    else {
        
        NSLog(@"Device is unable to send email in its current state.");
            [self launchMailAppOnDevice:nil];
    }
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [self dismissModalViewControllerAnimated:YES];

}


/// Launches the Mail application on the device. Workaround
-(void)launchMailAppOnDevice:(NSString *)body{
	NSString *recipients = [NSString stringWithFormat:@"mailto:%@?subject=%@", @"sangi.saleem@gmail.com", @"Sindhi App Recommendation"];
	NSString *mailBody = [NSString stringWithFormat:@"&body=%@", @""];
    
	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, mailBody];
	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
}



//
//// Launches the Mail application on the device. Workaround
//-(void)launchMailAppOnDevice:(NSString *)body{
//	NSString *recipients = [NSString stringWithFormat:@"mailto:%@?subject=%@", @"test@mail.com", @"iPhone App recommendation"];
//	NSString *mailBody = [NSString stringWithFormat:@"&body=%@", body];
//    
//	NSString *email = [NSString stringWithFormat:@"%@%@", recipients, mailBody];
//	email = [email stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//    
//	[[UIApplication sharedApplication] openURL:[NSURL URLWithString:email]];
//}
//
//// Call this method and pass parameters
//-(void) showComposer:(id)sender{
//	Class mailClass = (NSClassFromString(@"MFMailComposeViewController"));
//	if (mailClass != nil){
//		// We must always check whether the current device is configured for sending emails
//		if ([mailClass canSendMail]){
//			[self displayComposerSheet:sender];
//		}else{
//			[self launchMailAppOnDevice:sender];
//		}
//	}else{
//		[self launchMailAppOnDevice:sender];
//	}
//}
- (void)viewDidUnload {
    [self setIntroView:nil];
    [self setEnglishIntroView:nil];
    [super viewDidUnload];
}
@end
