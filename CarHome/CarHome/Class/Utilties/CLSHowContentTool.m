//
//  CLSHowContentTool.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLSHowContentTool.h"
#import <UIKit/UIKit.h>

static CLSHowContentTool *_manager;
@implementation CLSHowContentTool

+(instancetype)sharedManager {
    
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        _manager = [[self alloc] init];
    });
    
    return _manager;
    
}
@end
