//
//  newsCell.m
//  iAgent
//
//  Created by sinss on 13/5/22.
//  Copyright (c) 2013年 Good-idea Consulgint Inc. All rights reserved.
//

#import "newsCell.h"

@implementation newsCell

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
    DESTORY(_titleLabel);
    DESTORY(_contentLabel);
    DESTORY(_dateLabel);
    [super dealloc];
}
@end
