//
//  NewsPaperTableViewCell.h
//  Sindh 3
//
//  Created by Saleem Sangi on 5/28/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsPaperTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *imageOfNews;
@property (weak, nonatomic) IBOutlet UILabel *testlbl;
@property (weak, nonatomic) IBOutlet UILabel *newsTitle;
@end
