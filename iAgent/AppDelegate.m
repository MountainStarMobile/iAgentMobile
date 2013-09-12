//
//  AppDelegate.m
//  iAgent
//
//  Created by sinss on 13/5/18.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "AppDelegate.h"
#import "MSMasterViewController.h"
#import "ViewController.h"

@implementation AppDelegate

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [_navigationPaneViewController release], _navigationPaneViewController = nil;
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //程式初始化
    [self performSelector:@selector(initAppData)];
    
    self.navigationPaneViewController = [[MSNavigationPaneViewController alloc] init];
    
    MSMasterViewController *masterViewController = [[MSMasterViewController alloc] init];
    masterViewController.navigationPaneViewController = self.navigationPaneViewController;
    
    self.navigationPaneViewController.masterViewController = masterViewController;
    
    [masterViewController transitionToViewController:iAgentMenuTypeSalesList section:0];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.rootViewController = self.navigationPaneViewController;
    [self.window makeKeyAndVisible];
    
    //[[UITableView appearance] setBackgroundColor:tableViewBgColor];
    [[UINavigationBar appearance] setTitleTextAttributes:
     [NSDictionary dictionaryWithObjectsAndKeys:
      //[UIColor colorWithRed:0.0f/255.0f green:50.0f/255.0f blue:201.0f/255.0f alpha:1],
      [UIColor whiteColor],
      UITextAttributeTextColor,
      [UIColor clearColor],
      UITextAttributeTextShadowColor,
      [NSValue valueWithUIOffset:UIOffsetMake(0, -1)],
      UITextAttributeTextShadowOffset,
      [UIFont fontWithName:kFontBold size:20.0],
      UITextAttributeFont,
      nil]];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initAppData
{
    
}

@end
