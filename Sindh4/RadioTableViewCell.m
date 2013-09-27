//
//  RadioTableViewCell.m
//  Sindh 3
//
//  Created by Saleem Sangi on 5/28/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "RadioTableViewCell.h"

@implementation RadioTableViewCell
@synthesize delegate = _delegate;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        

        }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)playBtnPressed:(id)sender {
}

- (IBAction)stopBtnTapped:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:@"stopBtnPressed" object:self];
}

- (void) dealloc
{
    // If you don't remove yourself as an observer, the Notification Center
    // will continue to try and send notification objects to the deallocated
    // object.
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
