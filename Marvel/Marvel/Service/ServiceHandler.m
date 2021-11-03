//
//  ServiceHandler.m
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import "ServiceHandler.h"
#import "MarvelApi.h"
#import "../Models/Character.h"

@interface ServiceHandler ()

@end


@implementation ServiceHandler


//- (NSMutableArray *) getCharactersMarvel{
//
//    NSMutableArray *characterArray = [[NSMutableArray alloc] init];
//
//    NSURL *url = [NSURL URLWithString:@"https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=8215eb8802334abdaa903fc72f1d63f6&hash=9552a5213d3898f1943dae384747362b"];
//
//    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//
//        NSError *err ;
//        NSDictionary *marvelCharacterJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
//
//        if (err){
//            NSLog(@"Failed %@",err);
//            return characterArray;
//        }
//
//
//        for(NSDictionary *marvelCharacter in marvelCharacterJSON[@"data"][@"results"]){
//
//            Character *character = [[Character alloc] init];
//            character.characterId = marvelCharacter[@"id"];
//            character.characterName = marvelCharacter[@"name"];
//            character.characterDescription = marvelCharacter[@"description"];
//            //character.characterImage = ;
//
//            [characterArray addObject:character];
//        }
//
//        return characterArray;
//
//    }] resume];
//
//}

- (NSMutableArray *) getComics: (NSString *)url {
 
    return nil;
    
}

- (NSMutableArray *) getComicsById: (NSString *)characterId {
    
    return nil;
    
}

@end


