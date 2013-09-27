//
//  RadioStations.m
//  Sindh 3
//
//  Created by Saleem Sangi on 5/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import "RadioStations.h"

@implementation RadioStations

@synthesize name = _name;
@synthesize url = _url;
@synthesize open = _open;

+ (RadioStations*) radioWithDictionaryData: (NSDictionary*) dictionary {
    RadioStations* radio = [[RadioStations alloc] init];
    
    radio.name = [dictionary valueForKey:NAME_KEY];
    radio.url = [dictionary valueForKey:URL_KEY];
    radio.open = FALSE;
    
    return radio;
}


@end
