//
//  CLNewsModel.h
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CLNewsModel : NSObject
/*

 "dbid": 0,
 "id": 883811,
 "title": "速览日产全新3.0升双涡轮增压发动机",
 "mediatype": 10,
 "type": "技术设计",
 "time": "2016-01-13",
 "intacttime": "2016/1/13 18:00:00",
 "indexdetail": "http://www3.autoimg.cn/newsdfs/g13/M02/3B/AB/400x300_0_autohomecar__wKgH1FaVpgWAXeC8AACEKCznMuw884.jpg㊣http://www3.autoimg.cn/newsdfs/g10/M00/3A/D2/400x300_0_autohomecar__wKjBzVaUpb6AF9acAABxlQ-kuJs988.jpg㊣http://www2.autoimg.cn/newsdfs/g10/M06/3A/AA/400x300_0_autohomecar__wKgH0VaUpcCAVQhgAABZbTMQCPw083.jpg",
 "smallpic": "http://www2.autoimg.cn/newsdfs/g8/M09/3D/76/400x300_0_autohomecar__wKgHz1aUpbWAVG0NAAF_zPymZq4030.jpg",
 "replycount": 900,
 "pagecount": 1,
 "jumppage": 1,
 "lasttime": "20160113180000883811",
 "newstype": 0,
 "updatetime": "20160114102051",
 "coverimages": []
 
 
 "dbid": 0,
 "id": 882415,
 "title": "生旺火/包饺子 不同寻常的春节小记",
 "mediatype": 0,
 "type": "汽车文化",
 "time": "2016-02-17",
 "intacttime": "2016/2/17 20:00:00",
 "indexdetail": "",
 "smallpic": "http://www3.autoimg.cn/newsdfs/g22/M03/62/BA/400x300_0_autohomecar__wKgFW1bFM_6AEPiqAAGrx0LpbWo637.jpg",
 "replycount": 1237,
 "pagecount": 9,
 "jumppage": 1,
 "lasttime": "20160217200000882415",
 "newstype": 0,
 "updatetime": "20160218134145",
 "coverimages": [ ]

*/

@property (nonatomic,strong) NSNumber *dbid;
@property (nonatomic,strong) NSNumber *newsId;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSNumber *mediatype;
@property (nonatomic,strong) NSString *type;
@property (nonatomic,strong) NSString *time;
@property (nonatomic,strong) NSString *intacttime;
@property (nonatomic,strong) NSString *updatetime;
@property (nonatomic,strong) NSNumber *replycount;
@property (nonatomic,strong) NSString *smallpic;

+(CLNewsModel *)paresNewsModel:(NSDictionary *)dic;


@end



/*
 "updatetime": "20160219162255",
 "id": 74902,
 "imgurl": "http://www3.autoimg.cn/newsdfs/g21/M0E/63/13/640x320_0_autohomecar__wKjBwlbFWNWAIjcyAAb2c1mN_vM673.jpg",
 "title": "变化有诚意 试驾奔驰GLE 400 4MATIC",
 "type": "原创",
 "replycount": 0,
 "pageindex": 1,
 "JumpType": 0,
 "jumpurl": "",
 "mediatype": 2,
 "fromtype": 0
 
 */

@interface CLHeaderModel : NSObject

@property (nonatomic,assign) NSNumber *newsId;
@property (nonatomic,strong) NSString *imgurl;
@property (nonatomic,strong) NSString *title;

+(CLHeaderModel *)paresNewsModel:(NSDictionary *)dic;

@end
