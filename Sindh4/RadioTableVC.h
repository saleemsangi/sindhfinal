//
//  RadioTableVC.h
//  Sindh 3
//
//  Created by Saleem Sangi on 5/28/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RadioTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface RadioTableVC : UITableViewController <RadioTableViewCellDelegate>
@property (nonatomic, strong) MPMoviePlayerController *player;
@property (strong, nonatomic) IBOutlet UITableView *tableView;


@end
