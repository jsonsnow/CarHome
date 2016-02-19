//
//  CLNewsTool.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLNewsTool.h"

static CLNewsTool *_manager;

@implementation CLNewsTool
+(instancetype)shareNewsTool{
    
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[self alloc] init];
    });
    
    return _manager ;
}

@end
