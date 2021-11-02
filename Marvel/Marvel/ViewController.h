//
//  ViewController.h
//  Marvel
//
//  Created by Melih Ozden - HB on 1.11.2021.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

