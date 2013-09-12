//
//  switchCell.h
//  iAgent
//
//  Created by Leo Chang on 5/21/13.
//  Copyright (c) 2013 Good-idea Consulgint Inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SwitchCellProtocol.h"

@interface switchCell : UITableViewCell

@property (assign) id <SwitchCellProtocol> delegate;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UISwitch *aSwitch;

- (IBAction)switchChange:(UISwitch*)sender;

@end
