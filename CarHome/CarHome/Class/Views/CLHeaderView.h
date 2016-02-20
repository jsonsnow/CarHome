//
//  CLHeaderView.h
//  CarHome
//
//  Created by Aspmcll on 16/2/20.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLNewsModel.h"
@interface CLHeaderView : UIView
+(instancetype)createHeagerView:(NSArray  *)imageArray
               withClickBlock:(void(^)(UIImageView *image))clickBlock;
+(void)destroyTimer;
+(void)invokeTimer;

@end
