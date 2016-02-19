//
//  CLNewsTool.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLNewsTool.h"
#import "CLNetManager.h"
#import "CLNewsModel.h"

typedef NS_ENUM(NSUInteger, NewsListType) {
    NewsListTypeZuiXin,     //最新
    NewsListTypeXinWen,     //新闻
    NewsListTypePingCe,     //评测
    NewsListTypeDaoGou,     //导购
    NewsListTypeHangQing,   //行情
    NewsListTypeYongChe,    //用车
    NewsListTypeJiShu,      //技术
    NewsListTypeWenHua,     //文化
    NewsListTypeGaiZhuang,  //改装
    NewsListTypeYouJi,      //游记
};

static CLNewsTool *_manager;

@implementation CLNewsTool
+(instancetype)shareNewsTool{
    
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[self alloc] init];
    });
    
    return _manager ;
}

-(void)getNews:(NSInteger)type withTime:(NSString *)time withPage:(NSInteger)page
                       withSuccessBlock:(void (^)(NSArray *))successHandler
                        withFailerBlock:(void (^)(NSURLResponse *, NSError *))failerHandler{
    
    
    NSString *path = [self getCurentUrl:type WithTime:time andPage:page];
    [[CLNetManager shareNetManager] getByUrl:path andParams:nil withSuccessBlock:^(id object, NSURLResponse *response) {
        NSDictionary *dic           = object;
        NSDictionary *resultDic     = dic[@"result"];
        NSArray *newsListArray      = resultDic[@"newslist"];
        NSMutableArray *mutablArray = [NSMutableArray array];
        for (NSDictionary *newsDic in newsListArray) {
            
           CLNewsModel *model = [CLNewsModel paresNewsModel:newsDic];
           [mutablArray addObject:model];
        }
        
        successHandler([mutablArray copy]);
        
    } withFailerBlock:^(NSURLResponse *response, NSError *error) {
        
        failerHandler(response,error);
        
    }];
    
    
    
    
}

-(NSString *)getCurentUrl:(NewsListType)type WithTime:(NSString *)time andPage:(NSInteger)page{

    NSString *path = nil;
    switch (type) {
        case NewsListTypeJiShu:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt102-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeYouJi:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt100-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeDaoGou:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt60-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypePingCe:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt3-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeWenHua:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt97-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeXinWen:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt1-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeZuiXin:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt0-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeYongChe:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt82-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeHangQing:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c110100-nt2-p%@-s30-l%@.json", @(page), time];
            break;
        case NewsListTypeGaiZhuang:
            path=[NSString stringWithFormat:@"http://app.api.autohome.com.cn/autov5.0.0/news/newslist-pm1-c0-nt107-p%@-s30-l%@.json", @(page), time];
            break;
        default:
            break;
    }

    return path;

}


@end
