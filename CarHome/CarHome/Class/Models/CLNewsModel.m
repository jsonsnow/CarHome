//
//  CLNewsModel.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLNewsModel.h"

@implementation CLNewsModel
+(CLNewsModel *)paresNewsModel:(NSDictionary *)dic{
    
    return [[CLNewsModel alloc] paresNewsWithDic:dic];
    
}

-(CLNewsModel *)paresNewsWithDic:(NSDictionary *)dic{
    
    [self setValuesForKeysWithDictionary:dic];
    return self;
    
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    if ([key isEqualToString:@"id"]) {
        
        [self setValue:value forKey:@"newsId"];
        
    }
    
}

@end
