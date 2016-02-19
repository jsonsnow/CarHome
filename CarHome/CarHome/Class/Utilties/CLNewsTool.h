//
//  CLNewsTool.h
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLNewsTool : NSObject
+(instancetype)shareNewsTool;
-(void)getNews:(NSInteger)type
          withTime:(NSString *)time withPage:(NSInteger)page
          withSuccessBlock:(void(^)(NSArray *array))successHandler
          withFailerBlock:(void(^)(NSURLResponse *response,NSError *error))failerHandler;


@end
