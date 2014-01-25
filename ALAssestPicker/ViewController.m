//
//  ViewController.m
//  ALAssestPicker
//
//  Created by Karan Singh on 25/01/14.
//  Copyright (c) 2014 Trancis. All rights reserved.
//

#import "ViewController.h"
#import "ALAssetsLibraryManager.h"
#import "PhotoViewerController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property(nonatomic,strong)NSMutableArray *assets;
@end

@implementation ViewController
@synthesize assets=_assets;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _assets = [@[] mutableCopy];
    __block NSMutableArray *tmpAssets = [@[] mutableCopy];
    // 1
    ALAssetsLibraryManager *assetsLibmanager = [ALAssetsLibraryManager   defaultAssetsLibrary];
    // 2
    // note set ALAssetsGroupType as a ALAssetsGroupSavedPhotos for ios version 5.0- 6.3 to get only saved photos .
    [assetsLibmanager.library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if(result)
            {
                // 3
                [tmpAssets addObject:result];
            }
        }];
        
        // 4
//        NSSortDescriptor *sort = [NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO];
//        self.assets = [tmpAssets sortedArrayUsingDescriptors:@[sort]];
        self.assets = tmpAssets;
        
        // 5
        if ([_assets count]>0){
            [albumTable setDataSource:self];
            [albumTable setDelegate:self];
        [albumTable reloadData];
        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Error loading images %@", error);
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
	
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 25;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_assets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell=[albumTable dequeueReusableCellWithIdentifier:@"albumsCell" forIndexPath:indexPath];
     ALAsset *asset = self.assets[indexPath.row];
    
    ALAssetRepresentation *assetRepresentation=[asset defaultRepresentation];
    cell.imageView.image=[UIImage imageWithCGImage:[asset thumbnail]];
    cell.textLabel.text=[assetRepresentation filename];
       return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    PhotoViewerController *controller = (PhotoViewerController *)[storyboard instantiateViewControllerWithIdentifier:@"PhotoViewerController"];
    ALAsset *asset = self.assets[indexPath.row];
    
    ALAssetRepresentation *assetRepresentation=[asset defaultRepresentation];
    controller.alAssetRepresentation=assetRepresentation;
    [self.navigationController pushViewController:controller animated:YES];
    
    
   }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
