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
@property (weak, nonatomic) IBOutlet UIImageView *characterDetailImageView;
@property (weak, nonatomic) IBOutlet UILabel *characterDetailTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *characterDetailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
- (IBAction)favoriteBtnTapped:(id)sender;

@end

NS_ASSUME_NONNULL_END
