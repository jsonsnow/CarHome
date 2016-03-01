//
//  SQL.h
//  CarHome
//
//  Created by Aspmcll on 16/3/1.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString * const createNewsSQl = @"create table if not EXISTS news (newsId interger,title varchar,time varchar,replycount interger,thetype interger,imageurl varchar,updatetime varchar)";
static NSString * const saveNewsSQL = @"insert into news values(?,?,?,?,?,?,?)";

static NSString * const deleteNewsSQL = @"delete from news where";

static NSString * const selectNewsSQL = @"select *from news where";

static NSString * const updatetNewsSQL = @"update news set newsId = ?,title = ?,time = ?,replycount = ? ,imageurl = ? where thetype = ";


