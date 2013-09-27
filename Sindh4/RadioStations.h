//
//  RadioStations.h
//  Sindh 3
//
//  Created by Saleem Sangi on 5/27/13.
//  Copyright (c) 2013 Ignas. All rights reserved.
//

#import <Foundation/Foundation.h>

#define NAME_KEY              @"name"
#define URL_KEY               @"URL"

@interface RadioStations : NSObject

@property (nonatomic, strong) NSString*     name;
@property (nonatomic, strong) NSString*     url;
@property (nonatomic, assign) BOOL          open;

+ (RadioStations*) radioWithDictionaryData: (NSDictionary*) dictionary;

@end
