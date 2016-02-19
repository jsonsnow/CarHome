//
//  CLNetManager.h
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLNetManager : NSObject
/** 创建一个网络请求类的单例*/
+(instancetype)shareNetManager;
/** 封装一个get请求 请求成功执行successHandler 反之执行failHandler*/
-(void)getByUrl:(NSString *)path andParams:(NSString *)params
                withSuccessBlock:(void(^)(id object,NSURLResponse *response))successHandler
                 withFailerBlock:(void(^)(NSURLResponse *response,NSError *error))failerHandler;

/**封装一个post请求  请求成功执行successHandler 反之执行failHandler*/
-(void)postByUrl:(NSString *)path andParams:(NSDictionary *)params
                withSuccessBlock:(void(^)(id object,NSURLResponse *response))successHandler
                 withFailerBlock:(void(^)(NSURLResponse *response,NSError *error))failerHandler;

@end
