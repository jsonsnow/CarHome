//
//  UIBarButtonItem+CLBlock.h
//  CarHome
//
//  Created by Aspmcll on 16/2/21.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (CLBlock)
/** 创建BarButtonItem 样式为标题形式 通过block实现回调 
 
 *  另image形式可以通过 barButtonWithImage 方法创建
 
 *  另sysTemItem形式可以通过 barButtonWithSystemItem 方法创建
 
 */
+(instancetype)barButtonWithTiele:(NSString *)title
                          andType:(UIBarButtonItemStyle)type
                         andBlock:(void(^)(UIBarButtonItem *barButton))buttonItem;

+(instancetype)barButtonWithImage:(UIImage *)image
                          andType:(UIBarButtonItemStyle)type
                         andBlock:(void(^)(UIBarButtonItem *barButton))buttonItem;

+(instancetype)barButtonWithSystemItem:(UIBarButtonSystemItem)type
                              andBlock:(void(^)(UIBarButtonItem *barButton))buttonItem;

@end
