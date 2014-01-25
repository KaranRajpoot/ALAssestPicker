//
//  PhotoViewerController.m
//  ALAssestPicker
//
//  Created by Karan Singh on 25/01/14.
//  Copyright (c) 2014 Trancis. All rights reserved.
//

#import "PhotoViewerController.h"

@interface PhotoViewerController ()
{
    UIImageView *imageView;
}
@end

@implementation PhotoViewerController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *image = [UIImage imageWithCGImage:[_alAssetRepresentation fullScreenImage] scale:[_alAssetRepresentation scale] orientation:0];

    imageView=[[UIImageView alloc] initWithImage:image];
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
