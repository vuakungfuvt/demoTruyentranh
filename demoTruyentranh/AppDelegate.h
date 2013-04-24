//
//  AppDelegate.h
//  demoTruyentranh
//
//  Created by ThanhTung on 4/23/13.
//  Copyright (c) 2013 THANHTUNG. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainVC.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) MainVC *mainVC;
@end
