//
//  CLSHowContentTool.h
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XTPageViewController.h"

@interface CLSHowContentTool : NSObject<XTPageViewControllerDataSource,XTPageViewControllerDelegate>

+(instancetype)sharedManager;

@end
