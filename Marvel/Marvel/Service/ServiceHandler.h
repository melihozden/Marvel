//
//  ServiceHandler.h
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import <Foundation/Foundation.h>
#import "MarvelApi.h"
#import "AFNetworking.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServiceHandler : NSObject

- (void)getCharacters:(NSString *)requestURL completion:(void (^)(NSDictionary *, NSError *))completion;

@end

NS_ASSUME_NONNULL_END
