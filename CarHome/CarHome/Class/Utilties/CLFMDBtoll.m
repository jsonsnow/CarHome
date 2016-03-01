//
//  CLFMDBtoll.m
//  CarHome
//
//  Created by Aspmcll on 16/3/1.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLFMDBtoll.h"
#import "SQL.h"

#define DB_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"news.db"]

@implementation CLFMDBtoll
+(FMDatabase *)sharedDatabase {
    
   
    
    static FMDatabase *db = nil;
    static dispatch_once_t onecToken;
    dispatch_once(&onecToken, ^{
       
        db = [FMDatabase databaseWithPath:DB_PATH];
                
    });
    
    [db open];
    return db;
}

@end
