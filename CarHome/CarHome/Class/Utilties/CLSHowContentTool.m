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

//-(void)getCurentUrl:(NewsListType)type{
//    
//    switch (type) {
//        case NewsListTypeJiShu:
//            _path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p%@-s30-l%@.json", @(type), time];
//            break;
//        case NewsListTypeYouJi:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeDaoGou:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypePingCe:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeWenHua:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeXinWen:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeZuiXin:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeYongChe:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeHangQing:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c110100-nt2-p%@-s30-l%@.json", @(page), time];
//            break;
//        case NewsListTypeGaiZhuang:
//            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p%@-s30-l%@.json", @(page), time];
//            break;
//        default:
//            break;
//    }
//
//    
//}

@end
