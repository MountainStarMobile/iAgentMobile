//
//  inputFieldCell.m
//  iAgent
//
//  Created by Leo Chang on 5/21/13.
//  Copyright (c) 2013 Good-idea Consulgint Inc. All rights reserved.
//

#import "inputFieldCell.h"

@implementation inputFieldCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    DESTORY(_inputField);
    [super dealloc];
}

@end
