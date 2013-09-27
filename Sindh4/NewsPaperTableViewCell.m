//
//  NewsPaperTableViewCell.m
//  Sindh 3
//
//  Created by Saleem Sangi on 5/28/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "NewsPaperTableViewCell.h"

@implementation NewsPaperTableViewCell
@synthesize imageOfNews = _imageOfNews;

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

@end
