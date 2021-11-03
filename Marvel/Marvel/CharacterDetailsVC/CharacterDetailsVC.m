//
//  CharacterDetailsVC.m
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import "CharacterDetailsVC.h"
#import "SDWebImage/SDWebImage.h"

@interface CharacterDetailsVC ()

@end

@implementation CharacterDetailsVC

bool isFavorite = NO;

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self setupNavBar];
    [self setupUI];
    
}

- (void) setupNavBar{
    
    [UINavigationBar.appearance setTranslucent: true];
    self.navigationItem.title = @"";
  
    
    UINavigationBar *navigationBar = [self.navigationController navigationBar] ;
    [navigationBar setBackgroundColor: [UIColor blackColor]];
    
    UINavigationBarAppearance *navigationBarAppearance = [[UINavigationBarAppearance alloc] init];
    //navigationBarAppearance.configureWithOpaqueBackground;
    navigationBarAppearance.backgroundColor = [UIColor blackColor];
    navigationBar.standardAppearance = navigationBarAppearance;
    navigationBar.scrollEdgeAppearance = navigationBar.standardAppearance;
    
}

- (void) setupUI{
    
    UIColor *backgroundColor = [UIColor blackColor];
    self.view.backgroundColor = backgroundColor;
    
    [self.characterDetailImageView sd_setImageWithURL:[NSURL URLWithString:self.selectedCharacter.characterImageString] placeholderImage:[UIImage imageNamed:@"MarvelLogo.png"]];
    [self.characterDetailTitleLabel setText:self.selectedCharacter.characterName];
    
    if([self.selectedCharacter.characterDescription isEqualToString:@""]){
        [self.characterDetailDescriptionLabel setText:@"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."];
    }
    else{
        [self.characterDetailDescriptionLabel setText:self.selectedCharacter.characterDescription];
    }
    
    
}


    // Favorite button tapped. - Core Data
- (IBAction)favoriteBtnTapped:(id)sender {
    
    if (!isFavorite){
        [_favoriteButton setImage:[UIImage imageNamed:@"favorite_full_32px"] forState:UIControlStateNormal];
        isFavorite = !isFavorite;
    }else {
        [_favoriteButton setImage:[UIImage imageNamed:@"favorite_empty_32px"] forState:UIControlStateNormal];
        isFavorite = !isFavorite;
    }
}
@end
