//
//  DatabaseAccess.h
//  ExamKing
//
//  Created by sinss on 13/5/7.
//  Copyright (c) 2013年 GoodIea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsInfo.h"

@interface DatabaseAccess : NSObject

+(DatabaseAccess*) databaseAccessInstance;

- (NSArray*)GetNewsData;

@end
