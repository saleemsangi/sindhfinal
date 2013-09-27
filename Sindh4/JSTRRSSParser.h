//
//  JSTRRSSParser.h
//  XMLTest
//
//  Created by Saleem Sangi on 9/22/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSTRRSSParser : NSObject<NSXMLParserDelegate>
{
    NSMutableArray *_list;
    NSMutableDictionary *_item;
    
    NSMutableString *_tempStore;
    BOOL _foundItem;
}

- (NSMutableArray *) getParsedList;

@end
