//
//  CharacterCell.h
//  Marvel
//
//  Created by Melih Ozden - HB on 1.11.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CharacterCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *characterImageView;
@property (weak, nonatomic) IBOutlet UILabel *characterNameLabel;

@end

NS_ASSUME_NONNULL_END
