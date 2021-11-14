//
//  MarvelApi.h
//  Marvel
//
//  Created by Melih Ozden - HB on 1.11.2021.
//

#import <Foundation/Foundation.h>

#define API_KEY @"8215eb8802334abdaa903fc72f1d63f6"

NS_ASSUME_NONNULL_BEGIN

@interface MarvelApi : NSObject

@property NSString *baseURL;
@property NSString *timeStamp;
//@property NSString *privateKey;                 //  eb55b9026412db2875d8512d54d278a98b151bb8
@property NSString *apiKey;                     //  8215eb8802334abdaa903fc72f1d63f6
@property NSString *hashKey;                    //  (ts+privateKey+apiKey) 9552a5213d3898f1943dae384747362b

@end




NS_ASSUME_NONNULL_END
