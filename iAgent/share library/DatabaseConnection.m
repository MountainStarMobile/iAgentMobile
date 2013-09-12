//
//  DatabaseConnection.m
//  ExamKing
//
//  Created by sinss on 13/5/7.
//  Copyright (c) 2013年 GoodIea. All rights reserved.
//

#import "DatabaseConnection.h"
#import "PathAndDirectoryFunction.h"

FMDatabase *_controlDB;
FMDatabase *_dataDB;
@implementation DatabaseConnection

+ (FMDatabase*)GetControlDB
{
    //NSString *dbPath = [PathAndDirectoryFunction getDocumentPathWithFileName:db_control andExtension:@""];
    NSString *dbPath = [[NSBundle mainBundle] pathForResource:db_control ofType:@""];
    if (_controlDB == nil)
    {
        _controlDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_controlDB open])
        {
            NSLog(@"open control.sqlite succeed");
        }
    }
    else
    {
        if (![_controlDB goodConnection])
        {
            if ([_controlDB open])
            {
                NSLog(@"open control.sqlite again");
            }
        }
    }
    return _controlDB;
}

+ (FMDatabase*)GetDataDB
{
    NSString *dbPath = [PathAndDirectoryFunction getDocumentPathWithFileName:db_data andExtension:db_extension];
    if (_dataDB == nil)
    {
        _dataDB = [[FMDatabase databaseWithPath:dbPath] retain];
        if ([_dataDB open])
        {
            NSLog(@"open data.sqlite succeed");
        }
    }
    else
    {
        if (![_dataDB goodConnection])
        {
            if ([_dataDB open])
            {
                NSLog(@"open data.sqlite again");
            }
        }
    }
    return _dataDB;
}



@end
