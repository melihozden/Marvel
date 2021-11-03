//
//  Character.h
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Character : NSObject

@property NSNumber *characterId;
@property (strong, nonatomic) UIImage *characterImage;          // Character thumbnail
@property (strong, nonatomic) NSString *characterName;            // Name of each character
@property (strong, nonatomic) NSString *characterDescription;     // Description of each character

@property (strong, nonatomic) NSArray *comics;                    // Comics Array

@end

NS_ASSUME_NONNULL_END
