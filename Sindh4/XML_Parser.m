//
//  XML_Parser.m
//  Sindh4
//
//  Created by Saleem Sangi on 9/15/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "XML_Parser.h"

@implementation XML_Parser


-(id)initParser{
    
    if (self == [super init]) {
        app = (AppDelegate*)[[UIApplication sharedApplication]delegate];

    }
    return self;
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    
    if ([elementName isEqualToString:@"channel"]) {
        NSLog(@"found channel");
        app.listArray = [[NSMutableArray alloc]init];
    }
    else if([elementName isEqualToString:@"item"]){
        listItem = [[NewsList alloc] init];
        listItem.title = [attributeDict objectForKey:@"title"];
        listItem.description = [attributeDict objectForKey:@"description"];
        
    }
    
    
    
}


-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    if (!currentElementValue) {
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    }
    else
        [currentElementValue appendString:string];
}


-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if ([elementName isEqualToString:@"channel"]) {
        return;
    }
    
    if ([elementName isEqualToString:@"item"]) {
        [app.listArray addObject:listItem];
        listItem = nil;
    }
    else{
        [listItem setValue:currentElementValue forKey:elementName];
    }
    
    currentElementValue = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
    if (parser) {
        NSLog(@"array = %@", app.listArray);
    }
}
@end
