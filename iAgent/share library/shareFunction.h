//
//  shareFunction.h
//  ExamKing
//
//  Created by sinss on 13/5/7.
//  Copyright (c) 2013年 GoodIea. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shareFunction : NSObject

+(shareFunction*) shareFunctionInstance;

- (NSString*)GetSearchFieldNameWithKey:(NSString*)fieldKey;

@end
