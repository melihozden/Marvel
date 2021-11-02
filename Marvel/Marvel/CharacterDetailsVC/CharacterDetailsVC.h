//
//  CharacterDetailsVC.h
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import <UIKit/UIKit.h>
#import "Character.h"

NS_ASSUME_NONNULL_BEGIN

@interface CharacterDetailsVC : UIViewController

@property (strong, nonatomic) Character *selectedCharacter;

@end

NS_ASSUME_NONNULL_END
