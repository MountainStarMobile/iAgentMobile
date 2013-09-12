//
//  AppDelegate.h
//  iAgent
//
//  Created by sinss on 13/5/18.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class MSNavigationPaneViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;

@property (strong, nonatomic) MSNavigationPaneViewController *navigationPaneViewController;

@end
