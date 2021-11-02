//
//  MainCVC.m
//  Marvel
//
//  Created by Melih Ozden - HB on 2.11.2021.
//

#import "MainCVC.h"
#import "CharacterCell/CharacterCell.h"
#import "Models/Character.h"

@interface MainCVC ()

@property (strong,nonatomic) NSMutableArray<Character *> *characterArray;

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
    
    // Do any additional setup after loading the view.
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
   
    Character *character = [[Character alloc] init];
    
    NSLog(@"%l",(long)indexPath.row);
    character = [self.characterArray objectAtIndex:indexPath.row];
    
    cell.layer.shadowColor = UIColor.grayColor.CGColor;
    cell.layer.shadowOffset = CGSizeMake(5.0, 5.0);
    cell.layer.shadowRadius = 25.0;
    cell.layer.shadowOpacity = 0.9;
    cell.layer.cornerRadius = 15.0;
    
    cell.characterImageView.image = [UIImage imageNamed:@"MarvelLogo.png"];
    cell.characterNameLabel.text = character.characterName;
    //cell.characterNameLabel.text = [NSString stringWithFormat:@"%@", character.characterId];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

#pragma mark ServiceCall

- (void) getCharacters{
    
    NSURL *url = [NSURL URLWithString:@"https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=8215eb8802334abdaa903fc72f1d63f6&hash=9552a5213d3898f1943dae384747362b"];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err ;
        NSDictionary *marvelCharacterJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&err];
        
        if (err){
            NSLog(@"Failed %@",err);
            return;
        }
        
        NSMutableArray<Character *> *characterArray = NSMutableArray.new;
        for(NSDictionary *marvelCharacter in marvelCharacterJSON[@"data"][@"results"]){
            
            Character *character = [[Character alloc] init];
            character.characterId = marvelCharacter[@"id"];
            character.characterName = marvelCharacter[@"name"];
            character.characterDescription = marvelCharacter[@"description"];
            //character.characterImage = ;
            
            [characterArray addObject:character];
        }
        
        self.characterArray = characterArray;
        
        dispatch_sync(dispatch_get_main_queue(),^{
            
            [self.collectionView reloadData];
            
        });
        
    }] resume];
}


@end
