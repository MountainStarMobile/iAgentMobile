//
//  shareFunction.m
//  ExamKing
//
//  Created by sinss on 13/5/7.
//  Copyright (c) 2013年 GoodIea. All rights reserved.
//

#import "shareFunction.h"

shareFunction *shareFunctionInstance;

@implementation shareFunction

+ (shareFunction*)shareFunctionInstance
{
    if (shareFunctionInstance == nil)
    {
        shareFunctionInstance = [[shareFunction alloc] init];
    }
    return shareFunctionInstance;
}

- (NSString*)GetSearchFieldNameWithKey:(NSString*)fieldKey
{
    /*
     #define kCompanyType @"companyType.key"
     #define kCompanyName @"companyName.key"
     #define kServiceArea @"serviceArea.key"
     #define kJobTitle @"jobTitle.key"
     #define kServicePeriod @"servicePeriod.key"
     #define kEducation @"education.key"
     #define kLicense @"license.key"
     */
    NSString *desc = nil;
    if ([fieldKey isEqualToString:kCompanyType])
    {
        desc = [NSString stringWithFormat:@"公司類別"];
    }
    else if ([fieldKey isEqualToString:kCompanyName])
    {
        desc = [NSString stringWithFormat:@"公司名稱"];
    }
    else if ([fieldKey isEqualToString:kServiceArea])
    {
        desc = [NSString stringWithFormat:@"服務地區"];
    }
    else if ([fieldKey isEqualToString:kJobTitle])
    {
        desc = [NSString stringWithFormat:@"職稱"];
    }
    else if([fieldKey isEqualToString:kServicePeriod])
    {
        desc = [NSString stringWithFormat:@"服務年期"];
    }
    else if ([fieldKey isEqualToString:kEducation])
    {
        desc = [NSString stringWithFormat:@"學歷"];
    }
    else if ([fieldKey isEqualToString:kLicense])
    {
        desc = [NSString stringWithFormat:@"證照"];
    }
    return desc;
}

@end
