//
//  UIBarButtonItem+CLBlock.m
//  CarHome
//
//  Created by Aspmcll on 16/2/21.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "UIBarButtonItem+CLBlock.h"
#import <objc/runtime.h>

const char * barBarItem;
@implementation UIBarButtonItem (CLBlock)
+(instancetype)barButtonWithTiele:(NSString *)title
                          andType:(UIBarButtonItemStyle)type
                         andBlock:(void (^)(UIBarButtonItem *))buttonItem{
    
    
    return [[self alloc] initWithTitleBlock:title style:type target:self action:buttonItem];
    
}

+(instancetype)barButtonWithImage:(UIImage *)image
                          andType:(UIBarButtonItemStyle)type
                         andBlock:(void (^)(UIBarButtonItem *))buttonItem{
    
    
    return [[self alloc] initWithImageBlock:image style:type target:self action:buttonItem];
    
}

+(instancetype)barButtonWithSystemItem:(UIBarButtonSystemItem)type
                              andBlock:(void (^)(UIBarButtonItem *))buttonItem{
    
    return [[self alloc] initWithBarButtonSystemItemBlock:type target:self action:buttonItem];
    
}
-(instancetype)initWithTitleBlock:(NSString *)title
                       style:(UIBarButtonItemStyle)style
                      target:(id)target action:(void(^)(UIBarButtonItem *))buttonItem{
    
    [self setBlockPorperty:buttonItem];
    return [self initWithTitle:title style:style target:self action:@selector(clickBarItem)];
    
}

-(instancetype)initWithImageBlock:(UIImage *)image
                       style:(UIBarButtonItemStyle)style
                      target:(id)target action:(void(^)(UIBarButtonItem *))buttonItem{
    
    [self setBlockPorperty:buttonItem];
    return [self initWithImage:image style:style target:self action:@selector(clickBarItem)];
    
    
}


-(instancetype)initWithBarButtonSystemItemBlock:(UIBarButtonSystemItem)systemItem
                  target:(id)target action:(void(^)(UIBarButtonItem *))buttonItem{
    
    [self setBlockPorperty:buttonItem];
    return [self initWithBarButtonSystemItem:systemItem target:self action:@selector(clickBarItem)];
    
}

-(void)setBlockPorperty:(void(^)(UIBarButtonItem *))buttonItem{
    
    if (!objc_getAssociatedObject(self, &barBarItem)) {
        
        objc_setAssociatedObject(self, &barBarItem, buttonItem, OBJC_ASSOCIATION_COPY);
    }

    
}
-(void(^)(UIBarButtonItem *))getBlock{
    
    return objc_getAssociatedObject(self, &barBarItem);
    
}

-(void)clickBarItem{
    
    void(^clickBlock)(UIBarButtonItem *) = [self getBlock] ;
    clickBlock(self);
    
}

@end
