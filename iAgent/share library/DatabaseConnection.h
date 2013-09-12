//
//  DatabaseConnection.h
//  ExamKing
//
//  Created by sinss on 13/5/7.
//  Copyright (c) 2013年 GoodIea. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface DatabaseConnection : NSObject

+ (FMDatabase*)GetControlDB;
+ (FMDatabase*)GetDataDB;
@end
