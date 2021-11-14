//
//  MarvelApi.m
//  Marvel
//
//  Created by Melih Ozden - HB on 1.11.2021.
//

#import "MarvelApi.h"

#define API_KEY @"8215eb8802334abdaa903fc72f1d63f6"
#define TIME_STAMP @"1"
#define HASH_KEY @"9552a5213d3898f1943dae384747362b"

@implementation MarvelApi

-(id)init {
     if (self = [super init])  {
         self.apiKey = API_KEY;
         self.timeStamp = TIME_STAMP;
         self.hashKey = HASH_KEY;
         self.baseURL = @"https://gateway.marvel.com:443";
     }
     return self;
}

@end
