//
//  LatestNewsDetailVC.m
//  Sindh4
//
//  Created by Saleem Sangi on 9/22/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "LatestNewsDetailVC.h"
#import "AppDelegate.h"

@interface LatestNewsDetailVC ()

@end

@implementation LatestNewsDetailVC

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
    NSLog(@"index= %i", self.index);
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    AppDelegate *app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    self.titleTextView.text = [[app.listArray objectAtIndex:self.index] objectForKey:@"title"];
    NSString *description= [[app.listArray objectAtIndex:self.index] objectForKey:@"description"];
    NSString *stringWithOutName = [description
                                   stringByReplacingOccurrencesOfString:@"(Dunya News)" withString:@""];
    self.descriptionTextView.text = stringWithOutName;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitleTextView:nil];
    [self setDescriptionTextView:nil];
    [super viewDidUnload];
}
@end
