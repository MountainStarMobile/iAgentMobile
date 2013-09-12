//
//  SwitchCellProtocol.h
//  iAgent
//
//  Created by sinss on 13/5/21.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class switchCell;
@protocol SwitchCellProtocol <NSObject>

- (void)switchCell:(switchCell*)cell didSwitchChangeValue:(BOOL)value;

@end
