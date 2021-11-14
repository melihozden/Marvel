//
//  ServiceHandler.m
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import "ServiceHandler.h"

@interface ServiceHandler ()

@end


@implementation ServiceHandler

- (void)getCharacters:(NSString *)requestURL completion:(void (^)(NSDictionary *, NSError *))completion {
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] init];
    [manager GET:requestURL parameters:nil progress:nil success:^(NSURLSessionDataTask *operation, id responseObject){
        if (completion) completion((NSDictionary*)responseObject[@"data"][@"results"], nil);
    } failure:^(NSURLSessionDataTask *operation, NSError *error) {
        if (completion) completion(nil, error);
    }];
}

- (NSMutableArray *) getComics: (NSString *)url {
 
    return nil;
    
}

- (NSMutableArray *) getComicsById: (NSString *)characterId {
    
    return nil;
    
}

@end


