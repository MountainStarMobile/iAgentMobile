//
//  InsuranceNewsViewController.h
//  iAgent
//
//  Created by sinss on 13/5/21.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, NewsCategory) {
    NewsCategoryInsurance,
    NewsCategoryModical,
    NewsCategoryFinancial,
};

@interface InsuranceNewsViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITableView *aTableView;

@end
