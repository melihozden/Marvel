//
//  Character.h
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject

@property NSNumber *characterId;                                  // Character ID
@property (strong, nonatomic) NSString *characterImageString;     // Character thumbnail
@property (strong, nonatomic) NSString *characterName;            // Name of each character
@property (strong, nonatomic) NSString *characterDescription;     // Description of each character

@property (strong, nonatomic) NSMutableArray *comics;             // Comics Array

@end

NS_ASSUME_NONNULL_END
