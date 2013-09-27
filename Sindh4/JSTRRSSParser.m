//
//  JSTRRSSParser.m
//  XMLTest
//
//  Created by Saleem Sangi on 9/22/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "JSTRRSSParser.h"

@implementation JSTRRSSParser

- (id) init
{
    self = [super init];
    if (self) {
        // custom initializer
        _list = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSMutableArray *)getParsedList
{
    return _list;
}


#pragma mark - implement NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"item"]) {
        _item = [[NSMutableDictionary alloc]init];
        [_item setValue:[[NSMutableArray alloc] init] forKey:@"item"];
        [_list addObject:_item];
        _foundItem = YES;
    }
    
    if([elementName isEqualToString:@"title"] ||
       [elementName isEqualToString:@"description"]) {
        _tempStore = [[NSMutableString alloc] init];
    }
}


- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (_foundItem) {
        [_tempStore appendString:string];
    }
}


- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)
qName {
    if (_foundItem) {
        if([elementName isEqualToString:@"item"]) {
            _foundItem = NO;
            return; // don't preceed
        }
        
        // trim whitespace from left and right and replace commonly encoded html string
        NSString *content = [_tempStore stringByTrimmingCharactersInSet: [NSCharacterSet whitespaceCharacterSet]];
        content = [content stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
        content = [content stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
        content = [content stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
        content = [content stringByReplacingOccurrencesOfString:@"&shy;" withString:@"-"];
        content = [content stringByReplacingOccurrencesOfString:@"&raquo;" withString:@">>"];
        content = [content stringByReplacingOccurrencesOfString:@"&middot;" withString:@"-"];
        content = [content stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
        content = [content stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
        
        
        if( [elementName isEqualToString:@"title"] ) {
            [_item setObject:content forKey:@"title"];
        } else if( [elementName isEqualToString:@"description"] ) {
            [_item setObject:content forKey:@"description"];
//        } else if ( [elementName isEqualToString:@"item"]) {
//            NSMutableArray *temp = (NSMutableArray *)[_item objectForKey:@"item"];
//            [temp addObject:content];
        }
    }
}


- (void)parserDidEndDocument:(NSXMLParser *)parser{
    
    if (parser) {
        
    }
}
@end