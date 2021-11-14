//
//  MainCVC.m
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import "MainCVC.h"
#import "CharacterCell/CharacterCell.h"
#import "Models/Character.h"
#import "Service/MarvelApi.h"
#import "Service/ServiceHandler.h"
#import "SDWebImage/SDWebImage.h"
#import "CharacterDetailsVC/CharacterDetailsVC.h"

@interface MainCVC ()

@property (strong,nonatomic) NSMutableArray *characterArray;
@property (strong,nonatomic) NSDictionary *characterDictionary;

@end

@implementation MainCVC

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    [self setupStatusBar];
    [self setupNavBar];
    [self setupUI];
    
    [self getCharacters];
}

- (void) setupUI{
    
    self.collectionView.backgroundColor = [UIColor blackColor];
    
    UIColor *backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = backgroundColor;
    
}

- (void) setupNavBar{
    
    [UINavigationBar.appearance setTranslucent: true];
    self.navigationItem.title = @"";
  
    UIImage *img = [UIImage imageNamed:@"MarvelLogo.png"];
    UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    [imgView setImage:img];
   
    // setContent mode aspect fit
    [imgView setContentMode:UIViewContentModeScaleAspectFit];
    self.navigationItem.titleView = imgView;
    
    UINavigationBar *navigationBar = [self.navigationController navigationBar] ;
    [navigationBar setBackgroundColor: [UIColor blackColor]];
    
    UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
    //navigationBarAppearance.configureWithOpaqueBackground;
    navigationBarAppearance.backgroundColor = [UIColor blackColor];
    navigationBar.standardAppearance = navigationBarAppearance;
    navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance;
    
    
}
    // Status Bar Setup
- (void) setupStatusBar{
    // Change statusBar color
    if (@available(iOS 13.0, *)) {
        UIView *statusBar = [[UIView alloc]initWithFrame:[UIApplication sharedApplication].keyWindow.windowScene.statusBarManager.statusBarFrame] ;
        statusBar.backgroundColor = [UIColor blackColor];
        statusBar.tintColor = [UIColor whiteColor];
        [[UIApplication sharedApplication].keyWindow addSubview:statusBar];
    } else {
        // Fallback on earlier versions
    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.characterArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CharacterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
   
    Character *character = [self.characterArray objectAtIndex:indexPath.row];
    
    NSURL *url = [NSURL URLWithString:character.characterImageString];  // Get image URL from string
    
      // Shadowing
//    cell.characterImageView.layer.shadowColor = UIColor.grayColor.CGColor;
//    cell.characterImageView.layer.shadowOffset = CGSizeMake(25.0, 25.0);
//    cell.characterImageView.layer.shadowRadius = 15.0;
//    cell.characterImageView.layer.shadowOpacity = 0.75;
    cell.characterImageView.layer.cornerRadius = 10.0;
    
    cell.characterNameLabel.text = character.characterName;
    [cell.characterImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"MarvelLogo.png"]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CharacterDetailsVC *characterDetailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"characterDetailVC"];
    characterDetailVC.selectedCharacter = [self.characterArray objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:characterDetailVC animated:YES];
    
}

#pragma mark ServiceCall
- (void) getCharacters{
   
    self.characterArray = [[NSMutableArray alloc] init];
    
    MarvelApi *marvelApi = [[MarvelApi alloc] init];
    
    ServiceHandler *serviceHandler = [[ServiceHandler alloc] init];
    [serviceHandler getCharacters:[NSString stringWithFormat:@"%@/v1/public/characters?ts=%@&apikey=%@&hash=%@",marvelApi.baseURL,marvelApi.timeStamp,marvelApi.apiKey,marvelApi.hashKey] completion:^(NSDictionary * _Nonnull dictionary, NSError * _Nonnull error) {
        
        self.characterDictionary = dictionary;
        
        for(NSDictionary *marvelCharacter in self.characterDictionary){
        
            NSString *imageString = [NSString stringWithFormat:@"%@.%@",marvelCharacter[@"thumbnail"][@"path"],marvelCharacter[@"thumbnail"][@"extension"]];

            Character *character = [[Character alloc] init];
            character.characterId = marvelCharacter[@"id"];
            character.characterName = marvelCharacter[@"name"];
            character.characterDescription = marvelCharacter[@"description"];
            character.characterImageString = imageString;
            
            [self.characterArray addObject:character];
        }
        dispatch_async(dispatch_get_main_queue(),^{
        
            [self.collectionView reloadData];
        
        });
     }];
}

@end
