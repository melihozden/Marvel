//
//  ViewController.m
//  Marvel
//
//  Created by Melih Ozden - HB on 1.11.2021.
//

#import "ViewController.h"
#import "CharacterCell/CharacterCell.h"
#import "Models/Character.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize collectionView;
@synthesize characterArray;

NSString *cellId = @"CharacterCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    characterArray = [[NSMutableArray alloc] init];
    
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

#pragma mark - Service Call
- (void) getCharacters{
    
  
    NSURL *url = [NSURL URLWithString:@"https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=8215eb8802334abdaa903fc72f1d63f6&hash=9552a5213d3898f1943dae384747362b"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err ;
        NSDictionary *marvelCharacterJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err){
            NSLog(@"Failed %@",err);
            return;
        }
        
        for(NSDictionary *marvelCharacter in marvelCharacterJSON[@"data"][@"results"]){
            
            Character *character = [[Character alloc] init];
            character.characterId = marvelCharacter[@"id"];
            character.characterName = marvelCharacter[@"name"];
            character.characterDescription = marvelCharacter[@"description"];
            character.characterImage = ;
            
            [self.characterArray addObject:character];
        }
        
        dispatch_sync(dispatch_get_main_queue(),^{
            
            [self.collectionView reloadData];
            
        });
        
    }] resume];
}



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;

}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.characterArray.count;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    CharacterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    
    Character *character = self.characterArray[indexPath.row];
    
    // cell setup
    cell.layer.shadowColor = UIColor.lightGrayColor.CGColor;
    cell.layer.shadowOffset = CGSizeMake(5.0,5.0);
    cell.layer.shadowRadius = 25.0;
    cell.layer.shadowOpacity = 0.9;
    cell.layer.cornerRadius = 15.0;
    
    cell.clipsToBounds = true;
    cell.characterImageView.image = [UIImage imageNamed:@"MarvelLogo.png"];
    cell.characterImageView.layer.cornerRadius = 15.0;
    cell.characterNameLabel.text = character.characterName;
    //cell.characterImageView.image = character.characterImage;
     
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%d", indexPath.row);
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}




@end
