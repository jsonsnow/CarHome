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
#import "SQL.h"
#import "CLFMDBtoll.h"

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
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _manager = [[self alloc] init];
    });
    
    return _manager ;
}
-(instancetype)init{
    
    if (self = [super init]) {
        
        FMDatabase *db = [CLFMDBtoll sharedDatabase];
        [db executeUpdate:createNewsSQl];
        [db close];

    }
    
    
    return self;
}

-(void)getNews:(NSInteger)type
               withTime:(NSString *)time withPage:(NSInteger)page
              withSuccessBlock:(void (^)(NSArray *))successHandler
               withFailerBlock:(void (^)(NSURLResponse *, NSError *))failerHandler
               withHeaderBlock:(void (^)(NSArray *))headHandler{
    
    
    NSString *path = [self getCurentUrl:type WithTime:time andPage:page];
    [[CLNetManager shareNetManager] getByUrl:path andParams:nil withSuccessBlock:^(id object, NSURLResponse *response) {
        
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           
            
            NSDictionary *dic           = object;
            NSDictionary *resultDic     = dic[@"result"];
            NSArray *newsListArray      = resultDic[@"newslist"];
            NSArray *newsFocusingArray  = resultDic[@"focusimg"];
            NSMutableArray *mutablArray = [NSMutableArray array];
            for (NSDictionary *newsDic in newsListArray) {
                
                CLNewsModel *model = [CLNewsModel paresNewsModel:newsDic];
                [mutablArray addObject:model];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
               
                successHandler([mutablArray copy]);
                
            });
            
            NSMutableArray *focusArray  = [NSMutableArray array];
            if (newsFocusingArray.count>0) {
                
                for (NSDictionary *dic in newsFocusingArray) {
                    
                    CLHeaderModel *header = [CLHeaderModel paresNewsModel:dic];
                    [focusArray addObject:header];
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    headHandler([focusArray copy]);
                    
                });
                
            }

            
        });
                //NSLog(@"currentThread:%@",[NSThread currentThread]);
        
        
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
-(BOOL)deleteDataWithType:(NSInteger)num {
    
    
    BOOL isSueeces = NO;
    FMDatabase *db = [CLFMDBtoll sharedDatabase];
    isSueeces = [db executeUpdateWithFormat:@"delete from news where thetype = %@",@(num)];
    [db close];
    return isSueeces;
    
}
-(void)loadData:(NSInteger)num andResult:(void (^)(NSArray *))resultHandle{
    
    FMDatabase *db =  [CLFMDBtoll sharedDatabase];
    FMResultSet *set = [db executeQueryWithFormat:@"select *from news where thetype = %@",@(num)];
    NSMutableArray *newsArray = [NSMutableArray array];
    while ([set next]) {
        
        CLNewsModel *news = [CLNewsModel new];
        news.newsId = [set objectForColumnName:@"newsId"];
        news.title  = [set objectForColumnName:@"title"];
        news.replycount = [set objectForColumnName:@"replycount"];
        news.time = [set objectForColumnName:@"time"];
        news.smallpic = [set stringForColumn:@"imageurl"];
        news.updatetime = [set stringForColumn:@"updatetime"];
    
        [newsArray addObject:news];
        
    }
    [set close];
    [db close];
    resultHandle([newsArray copy]);
    

    
}
-(BOOL)saveData:(NSArray *)newsArray andy:(NSInteger)num {
    
    BOOL isSucesss = NO;
    
    FMDatabase *db = [CLFMDBtoll sharedDatabase];
    
    for (CLNewsModel *news in newsArray) {
        
      
        [db executeUpdate:saveNewsSQL,news.newsId,news.title,news.time,news.replycount,@(num),news.smallpic,news.updatetime];
        
    }
    [db close];
    return isSucesss;

    
}

//-(void)loadData:(void (^)(NSArray *))resultHandle {
//    
//    FMDatabase *db =  [CLFMDBtoll sharedDatabase];
//    FMResultSet *set = [db executeQuery:selectNewsSQL];
//    
//    NSMutableArray *newsArray = [NSMutableArray array];
//    while ([set next]) {
//        
//        CLNewsModel *news = [CLNewsModel new];
//        news.newsId = [set objectForColumnName:@"newsId"];
//        news.title  = [set objectForColumnName:@"title"];
//        news.replycount = [set objectForColumnName:@"replycount"];
//        news.time = [set objectForColumnName:@"time"];
//        [newsArray addObject:news];
//        
//    }
//    [set close];
//    resultHandle([newsArray copy]);
//    
//}
//-(BOOL)deleteData {
//    
//    BOOL isSueeces = NO;
//    FMDatabase *db = [CLFMDBtoll sharedDatabase];
//    isSueeces = [db executeUpdate:deleteNewsSQL];
//    [db close];
//    return isSueeces;
//    
//}
//-(BOOL)saveData:(NSArray *)newsArray {
//    
//    BOOL isSucesss = NO;
//    FMDatabase *db = [CLFMDBtoll sharedDatabase];
//    
//    for (CLNewsModel *news in newsArray) {
//        
//       isSucesss = [db executeUpdate:saveNewsSQL,news.newsId,news.title,news.time,news.replycount];
//        
//    }
//    [db close];
//    return isSucesss;
//    
//}



@end
