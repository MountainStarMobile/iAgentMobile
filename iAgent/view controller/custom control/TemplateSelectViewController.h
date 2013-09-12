//
//  TemplateSelectViewController.h
//  iAgent
//
//  Created by Leo Chang on 5/21/13.
//  Copyright (c) 2013 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "tempSelectItemProtocol.h"

@interface TemplateSelectViewController : UIViewController

@property (assign) id <tempSelectItemProtocol> delegate;
@property (nonatomic, retain) IBOutlet UITableView *aTableView;
@property (nonatomic, retain) NSArray *sourceArray;
@property (nonatomic, retain) NSNumber *selectIndex;
@property (nonatomic, retain) NSString *keyField;

@end
