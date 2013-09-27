//
//  HomeVC.h
//  Sindh 3
//
//  Created by Saleem Sangi on 5/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AudioToolbox/AudioToolbox.h>

@interface HomeVC : UIViewController <AVAudioPlayerDelegate, NSURLConnectionDelegate>
@property (strong, nonatomic) AVPlayer *audioPlayer;
@property (weak, nonatomic) IBOutlet UIImageView *shairi;
@property (strong, nonatomic) NSMutableData *data;
@property (strong, nonatomic) NSURLConnection *urlConn;

@end
