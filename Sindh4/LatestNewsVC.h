//
//  LatestNewsVC.h
//  Sindh4
//
//  Created by Saleem Sangi on 9/15/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LatestNewsVC : UITableViewController <UITableViewDataSource, UITableViewDelegate,NSURLConnectionDelegate,NSXMLParserDelegate>
{
    NSMutableString *currentElementValue;

}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
