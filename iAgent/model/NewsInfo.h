//
//  NewsInfo.h
//  iAgent
//
//  Created by Leo Chang on 5/22/13.
//  Copyright (c) 2013 Good-idea Consulgint Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsInfo : NSObject

@property (nonatomic, retain) NSString *date;
@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *content;
@property (nonatomic, retain) NSString *url;
@property (nonatomic, retain) NSString *auth;
@property (nonatomic, retain) NSString *expiredDate;
@property (assign) BOOL expand;

@end
