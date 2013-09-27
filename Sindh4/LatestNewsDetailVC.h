//
//  LatestNewsDetailVC.h
//  Sindh4
//
//  Created by Saleem Sangi on 9/22/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatestNewsDetailVC : UIViewController

@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;
@property ( nonatomic) NSUInteger index;

@end
