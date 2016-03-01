//
//  CLNewsTool.h
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SQLInterface.h"
@interface CLNewsTool : NSObject<SQLInterface>

+(instancetype)shareNewsTool;
-(void)getNews:(NSInteger)type
          withTime:(NSString *)time withPage:(NSInteger)page
          withSuccessBlock:(void(^)(NSArray *array))successHandler
          withFailerBlock:(void(^)(NSURLResponse *response,NSError *error))failerHandler
          withHeaderBlock:(void(^)(NSArray *array))headHandler;


-(BOOL)deleteDataWithType:(NSInteger)num;
-(BOOL)saveData:(NSArray *)newsArray andy:(NSInteger)num;
-(void)loadData:(NSInteger)num andResult:(void(^)(NSArray *reuslt))resultHandle;

@end
