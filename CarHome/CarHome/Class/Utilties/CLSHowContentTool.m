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
@property (nonatomic,strong) NSArray *titleArray;

@end
@implementation CLSHowContentTool

-(NSArray *)titleArray{
    
    if (!_titleArray) {
        
        _titleArray = @[@"最新",@"新闻",@"测评",@"导购",@"行情",@"用车",@"技术",@"文化",@"改装",@"游记"];
    }
    
    return _titleArray ;
}
+(instancetype)sharedManager {
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
       
        _manager = [[CLSHowContentTool alloc] init];
    });
    
    return _manager;
    
}
-(instancetype)init{
    
    if (self = [super init]) {
        
        
    }
    
    return self;
}

#pragma mark - pageview -controller
-(NSInteger)numberOfPages {
    
    return self.titleArray.count;
}

-(NSString *)titleOfPage:(NSInteger)page{
    
//    NewsListTypeZuiXin,     //最新
//    NewsListTypeXinWen,     //新闻
//    NewsListTypePingCe,     //评测
//    NewsListTypeDaoGou,     //导购
//    NewsListTypeHangQing,   //行情
//    NewsListTypeYongChe,    //用车
//    NewsListTypeJiShu,      //技术
//    NewsListTypeWenHua,     //文化
//    NewsListTypeGaiZhuang,  //改装
//    NewsListTypeYouJi,      //游记
    return self.titleArray[page];
}

-(UIViewController *)constrollerOfPage:(NSInteger)page{
    
    UIStoryboard *mainBoard  = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    CLNewsViewController *vc = [mainBoard instantiateViewControllerWithIdentifier:@"NewsController"];
    vc.num = page;

    return vc;
    
}


@end
