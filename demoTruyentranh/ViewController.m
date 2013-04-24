//
//  ViewController.m
//  demoTruyentranh
//
//  Created by ThanhTung on 4/23/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
@interface ViewController (){
    NSMutableArray *_arrImage;
    UIImageView *_imageView;
    UIView *_view;
    int _currentPage;
    UILabel *_lblPage;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Tập 1";
    _arrImage = [[NSMutableArray alloc] init];
    _imageView = [[UIImageView alloc] init];
    _lblPage = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    _lblPage.layer.borderWidth = 2.0;
    
    _view = [[UIView alloc] initWithFrame:self.view.bounds];
    _lblPage.textColor = [UIColor redColor];
    for (int i = 1; i < 52; i++) {
        NSString *name = [[NSString alloc] init];
        if (i < 10) {
            name = [NSString stringWithFormat:@"img00%d.jpg",i];
        } else {
            name = [NSString stringWithFormat:@"img0%d.jpg",i];
        }
        [_arrImage addObject:[UIImage imageNamed:name]];
    }
    _imageView.frame = self.view.bounds;
    _imageView.userInteractionEnabled = YES;
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [_imageView addGestureRecognizer:swipeRight];
    [_imageView addGestureRecognizer:swipeLeft];
    _imageView.image = [_arrImage objectAtIndex:0];
    _currentPage = 1;
    _lblPage.textAlignment = NSTextAlignmentCenter;
    _lblPage.text = [NSString stringWithFormat:@"Page: %d - %d",_currentPage,_arrImage.count];
    _lblPage.backgroundColor = [UIColor clearColor];
    [_view addSubview:_imageView];
    [_view addSubview:_lblPage];
    [self.view addSubview:_view];
}
- (void) handleSwipeLeft : (UISwipeGestureRecognizer *)sender{
    if (_currentPage < _arrImage.count) {
        _currentPage++;
        [UIView transitionWithView:_view
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCurlUp
                        animations:^{
                            _imageView.image = [_arrImage objectAtIndex:_currentPage];
                            _lblPage.text = [NSString stringWithFormat:@"Page: %d - %d",_currentPage,_arrImage.count];
                        }
                        completion:^(BOOL finished){
                            
                        }];
    }
}
- (void) handleSwipeRight : (UISwipeGestureRecognizer *)sender{
    if (_currentPage > 1) {
        _currentPage--;
        [UIView transitionWithView:_view
                          duration:0.5
                           options:UIViewAnimationOptionTransitionCurlDown
                        animations:^{
                            _imageView.image = [_arrImage objectAtIndex:_currentPage - 1];
                            _lblPage.text = [NSString stringWithFormat:@"%d - %d",_currentPage,_arrImage.count];
                        }
                        completion:^(BOOL finished){
                            
                        }];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
