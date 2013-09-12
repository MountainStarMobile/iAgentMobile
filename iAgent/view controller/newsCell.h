//
//  newsCell.h
//  iAgent
//
//  Created by sinss on 13/5/22.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

#define newContentWordUunit 21
#define newLineHeightUnit 15

@interface newsCell : UITableViewCell

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *dateLabel;
@property (nonatomic, retain) IBOutlet UILabel *contentLabel;

@end
