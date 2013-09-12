//
//  agentItemCell.m
//  iAgent
//
//  Created by sinss on 13/5/20.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "agentItemCell.h"

@implementation agentItemCell

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
    DESTORY(_nameLabel);
    DESTORY(_phoneLabel);
    DESTORY(_title1Label);
    DESTORY(_title2Label);
    [super dealloc];
}

@end
