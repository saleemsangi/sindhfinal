//
//  XML_Parser.h
//  Sindh4
//
//  Created by Saleem Sangi on 9/15/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsList.h"
#import "AppDelegate.h"
@interface XML_Parser : NSObject <NSXMLParserDelegate>
{
    NewsList *listItem;
    NSMutableString *currentElementValue;
    AppDelegate *app;
}

-(id)initParser;
@end
