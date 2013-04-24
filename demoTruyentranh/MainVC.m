//
//  MainVC.m
//  demoTruyentranh
//
//  Created by ThanhTung on 4/24/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import "MainVC.h"
#import <QuartzCore/QuartzCore.h>
#import "ViewController.h"
@interface MainVC (){
    ViewController *myView;
    UIButton *_btnStart;
    UIButton *_btnContinue;
    UIImageView *_imageView;
    NSArray *arr;
}

@end

@implementation MainVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Truyện Trạng Quỳnh";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *imv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imv.image = [UIImage imageNamed:@"Anhbia.jpg"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"plist"];
    arr = [[NSArray alloc] initWithContentsOfFile:path];
    NSLog(@"%d",[arr count]);
    [self.view addSubview:imv];
    NSNumber *number = [arr objectAtIndex:0];
     // Do any additional setup after loading the view from its nib.
    _btnStart = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 100, 40)];
    
    //_btnStart.backgroundColor = [UIColor whiteColor];
    _btnStart = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btnStart setTitle:@"START" forState:UIControlStateNormal];
    [_btnStart setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _btnStart.frame = CGRectMake(100, 200, 100, 40);
    _btnStart.backgroundColor = [UIColor clearColor];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 200, 100, 100)];
    _imageView.image = [UIImage imageNamed:@"images.jpeg"];
    _btnContinue = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [_btnContinue setTitle:@"CONTINUE" forState:UIControlStateNormal];
    _btnContinue.frame = CGRectMake(100, 250, 100, 40);
    [self.view addSubview:_btnContinue];
    _imageView.alpha = 0;
    _imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_imageView];
    [UIView transitionWithView:_imageView
                      duration:2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    animations:^{
                        _imageView.alpha = 1;
                        [self.view addSubview:_imageView];
                    }completion:^(BOOL finished){
                        
                    }];
    [_btnStart addTarget:self
                  action:@selector(actionevent:)
        forControlEvents:UIControlEventTouchUpInside];
    [_btnContinue addTarget:self
                     action:@selector(act1:)
           forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btnStart];
}
- (void) act1:(UIButton*)sender{
    myView = [[ViewController alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"file" ofType:@"plist"];
    arr = [[NSArray alloc] initWithContentsOfFile:path];
    myView.current = [arr objectAtIndex:0];
    UIBarButtonItem *myBarButtonItem = [UIBarButtonItem new];
    myBarButtonItem.title = @"Back"; // or whatever text you want
    self.navigationItem.backBarButtonItem = myBarButtonItem;
    [self.navigationController pushViewController:myView animated:YES];
}
- (void) actionevent:(UIButton*)sender{
    NSLog(@"tung");
    myView = [[ViewController alloc] init];
    myView.current = 0;
    UIBarButtonItem *myBarButtonItem = [UIBarButtonItem new];
    myBarButtonItem.title = @"Back"; // or whatever text you want
    self.navigationItem.backBarButtonItem = myBarButtonItem;
    [self.navigationController pushViewController:myView animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
