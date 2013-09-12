//
//  SalesListViewController.h
//  iAgent
//
//  Created by sinss on 13/5/19.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SalesListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UIScrollView *aScrollView;
@property (nonatomic, retain) IBOutlet UITableView *aTableView;

@end
