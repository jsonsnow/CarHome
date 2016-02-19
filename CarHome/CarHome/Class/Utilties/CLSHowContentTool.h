//
//  CLSHowContentTool.h
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTPageViewController.h"

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


@interface CLSHowContentTool : NSObject<XTPageViewControllerDataSource>

+(instancetype)sharedManager;

@end
