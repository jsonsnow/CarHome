//
//  UIImageView+CLBlock.m
//  CarHome
//
//  Created by Aspmcll on 16/2/20.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "UIImageView+CLBlock.h"
#import <objc/runtime.h>

const char *imageView;
@implementation UIImageView (CLBlock)
+(instancetype)imageViewWithBlock:(void (^)(UIImageView *))clickBlock{
    
    
    return [[self alloc] initWithBlock:clickBlock];
    
}

-(instancetype)initWithBlock:(void(^)(UIImageView *imaegView))clickBlock{
    
    if (self = [super init]) {
        
        
        if (!objc_getAssociatedObject(self, &imageView)) {
            
            objc_setAssociatedObject(self, &imageView, clickBlock, OBJC_ASSOCIATION_COPY);
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImageView)];
        tap.numberOfTapsRequired    = 1;
        self.userInteractionEnabled = YES;
        [self addGestureRecognizer:tap];
        
    }
    
    return self;
    
}
-(void)clickImageView{
    
    void(^clickBlock)(UIImageView *) = objc_getAssociatedObject(self, &imageView);
    clickBlock(self);
        
}

@end
