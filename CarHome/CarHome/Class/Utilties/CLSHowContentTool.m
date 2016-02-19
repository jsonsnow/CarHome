//
//  CLSHowContentTool.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLSHowContentTool.h"
#import <UIKit/UIKit.h>
#import "CLNewsViewController.h"

static CLSHowContentTool *_manager;
@interface CLSHowContentTool ()
@property (nonatomic,copy) NSString *path;


@end
@implementation CLSHowContentTool


+(instancetype)sharedManager {
    
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        _manager = [[self alloc] init];
    });
    
    return _manager;
    
}

#pragma mark - pageview -controller
-(NSInteger)numberOfPages {
    
    return 1;
}

-(NSString *)titleOfPage:(NSInteger)page{
    
    return @"hello";
}

-(UIViewController *)constrollerOfPage:(NSInteger)page{
    
    
    CLNewsViewController *vc = [CLNewsViewController new];
    
    return vc;
    
}


@end
