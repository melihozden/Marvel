//
//  ViewController.m
//  Marvel
//
//  Created by Melih Ozden - HB on 1.11.2021.
//

#import "ViewController.h"
#import "CharacterCell/CharacterCell.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupStatusBar];
    [self setupNavBar];
    [self setupUI];
    
    
}

- (void) setupUI{
    
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
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



#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    NSString *cellIdentifier = @"CharacterCell";
        CharacterCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // cell setup
    cell.layer.shadowColor = UIColor.lightGrayColor.CGColor;
    cell.layer.shadowOffset = CGSizeMake(5.0,5.0);
    cell.layer.shadowRadius = 25.0;
    cell.layer.shadowOpacity = 0.9;
    cell.layer.cornerRadius = 15.0;
    
    cell.clipsToBounds = false;
    cell.characterImageView.image = [UIImage imageNamed:@"MarvelLogo.png"];
    cell.characterImageView.layer.cornerRadius = 15.0;
    cell.characterNameLabel.text = @"Deneme";
     
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    //NSLog(@"%d", indexPath.row);
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
}


@end
