//
//  AnimationDemoViewController.m
//  MWPhotoBrowser
//
//  Created by 柬斐 王 on 15/9/28.
//  Copyright © 2015年 Michael Waterfall. All rights reserved.
//

#import "AnimationDemoViewController.h"
#import "MWPhotoBrowser.h"

@interface AnimationDemoViewController () <MWPhotoBrowserDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation AnimationDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"photo1t.jpg"];
    UIImageView *imageView = [UIImageView new];
    imageView.frame = CGRectMake(20, 60, 100, 100);
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    imageView.image = image;
    imageView.userInteractionEnabled = YES;
    [self.view addSubview:imageView];
    self.imageView = imageView;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapImageView)];
    [imageView addGestureRecognizer:tapRecognizer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didTapImageView {
    // Create browser
    MWPhotoBrowser *browser = [[MWPhotoBrowser alloc] initWithDelegate:self];
    browser.displayActionButton = 0;
    browser.displayNavArrows = 0;
    browser.displaySelectionButtons = 0;
    browser.alwaysShowControls = 0;
    browser.zoomPhotosToFill = YES;
    browser.enableGrid = 0;
    browser.startOnGrid = 0;
    browser.enableSwipeToDismiss = NO;
    browser.autoPlayOnAppear = 0;
    [browser setCurrentPhotoIndex:0];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:browser];
    nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nc animated:YES completion:nil];
}

#pragma mark - MWPhotoBrowserDelegate

- (NSUInteger)numberOfPhotosInPhotoBrowser:(MWPhotoBrowser *)photoBrowser {
    return 1;
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser photoAtIndex:(NSUInteger)index {
    return [MWPhoto photoWithImage:[UIImage imageNamed:@"photo1.jpg"]];
}

- (id <MWPhoto>)photoBrowser:(MWPhotoBrowser *)photoBrowser scaleImageAtIndex:(NSUInteger)index {
    return [MWPhoto photoWithImage:[UIImage imageNamed:@"photo1t.jpg"]];
}

- (UIImageView *)photoBrowser:(MWPhotoBrowser *)photoBrowser scaleAnimationImageViewAtIndex:(NSUInteger)index {
    return self.imageView;
}

@end
