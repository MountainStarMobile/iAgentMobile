//
//  NewsInfo.m
//  iAgent
//
//  Created by Leo Chang on 5/22/13.
//  Copyright (c) 2013 Good-idea Consulgint Inc. All rights reserved.
//

#import "NewsInfo.h"

@implementation NewsInfo

- (void)dealloc
{
    DESTORY(_date);
    DESTORY(_title);
    DESTORY(_content);
    DESTORY(_url);
    DESTORY(_auth);
    DESTORY(_expiredDate);
    [super dealloc];
}

@end
