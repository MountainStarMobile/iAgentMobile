//
//  SearchTableViewController.h
//  iAgent
//
//  Created by sinss on 13/5/21.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SearchViewSection) {
    SearchViewSectionKeyword,
    SearchViewSectionFields,
    SearchViewSectionArea,
    SearchViewSectionSearchButton,
};

@interface SearchTableViewController : UITableViewController

@end
