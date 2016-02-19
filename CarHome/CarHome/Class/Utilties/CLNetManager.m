//
//  CLNetManager.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLNetManager.h"

CLNetManager *_manager;
@implementation CLNetManager
+(instancetype)shareNetManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        _manager = [[self alloc] init];
    });
    
    return _manager;
}
-(void)getByUrl:(NSString *)path andParams:(NSString *)params
            withSuccessBlock:(void (^)(id, NSURLResponse *))successHandler
            withFailerBlock:(void (^)(NSURLResponse *, NSError *))failerHandler{
    
    if (params) {
        [path stringByAppendingString:[NSString stringWithFormat:@"?%@",params]];
    }
    
   // NSString  *pathStr = [path  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:path];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            if (!error) {
                
                id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                successHandler(object,response);
               
            } else {
                
                failerHandler(response,error);
                
            }
            
        });
        
        
    }];
    //开始请求
    [task resume];
    
    
}

-(void)postByUrl:(NSString *)path andParams:(NSDictionary *)params withSuccessBlock:(void (^)(id, NSURLResponse *))successHandler withFailerBlock:(void (^)(NSURLResponse *, NSError *))failerHandler{
    
    NSURL *url = [NSURL URLWithString:path];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSError*  error;
    
    if ([NSJSONSerialization isValidJSONObject:params]) {
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:NSJSONWritingPrettyPrinted error:&error];
        [request  setHTTPBody:jsonData];
        
        
        NSURLSession *session = [NSURLSession sharedSession];
        NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (!error) {
                    
                    id  object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                    successHandler(object,response);
                    
                } else {
                    
                    
                    failerHandler(response,error);
                }
                
               
                
            });
            
        }];
        //开始请求
        [task resume];
        
    }
    
    
    
}

@end
