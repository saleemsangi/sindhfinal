//
//  RadioTableViewCell.h
//  Sindh 3
//
//  Created by Saleem Sangi on 5/28/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol RadioTableViewCellDelegate <NSObject>

-(void) playBtnTapped;
-(void) stopBtnTapped;
@end

@interface RadioTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UIView *buttonView;
@property (nonatomic, strong) id <RadioTableViewCellDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *songName;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property (weak, nonatomic) IBOutlet UIImageView *seperatorImage;

- (IBAction)playBtnPressed:(id)sender;
- (IBAction)stopBtnTapped:(id)sender;
@end
