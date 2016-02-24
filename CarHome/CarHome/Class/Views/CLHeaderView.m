//
//  CLHeaderView.m
//  CarHome
//
//  Created by Aspmcll on 16/2/20.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLHeaderView.h"
#import "UIImageView+WebCache.h"
#import "UIImageView+CLBlock.h"

#define SCREENWEIGHT  [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT  [UIScreen mainScreen].bounds.size.height

static NSTimer *_timer;
@interface CLHeaderView ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIPageControl *pageController;
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,weak)   UIScrollView *scrollView;
@property (nonatomic,assign) NSInteger num;

@end

@implementation CLHeaderView

+(instancetype)createHeagerView:(NSArray *)imageArray withClickBlock:(void (^)(UIImageView *))clickBlock{
    
    if (imageArray==nil) {
        
        return nil;
    }
    
    return [[CLHeaderView alloc] initWithcreateHeaderViewArray:imageArray withClickBlock:clickBlock];
    
}

-(instancetype)initWithcreateHeaderViewArray:(NSArray *)imageArray withClickBlock:(void(^)(UIImageView *imageView))clickBlock{
    
    if (self = [super init]) {
        
        
        UIScrollView *scorllView = [UIScrollView new];
        _scrollView = scorllView;
        self.count  = imageArray.count;
        scorllView.showsHorizontalScrollIndicator = NO;
        scorllView.showsVerticalScrollIndicator   = NO;
        scorllView.pagingEnabled                  = YES;
        scorllView.delegate      = self;
        scorllView.frame = CGRectMake(0, 0, SCREENWEIGHT, 150);
        scorllView.contentSize = CGSizeMake(SCREENWEIGHT*self.count, 150);
        self.frame       = CGRectMake(0, 0, SCREENWEIGHT, 150);
            for (int i = 0; i<imageArray.count; i++) {
        
                CLHeaderModel *model   = imageArray[i];
                UIImageView *imageView = [UIImageView imageViewWithBlock:clickBlock];
                imageView.tag          = i;
                CGRect frame;
                frame       = CGRectMake(SCREENWEIGHT*i, 0, SCREENWEIGHT, 150);
               // NSLog(@"%@",frame);
                imageView.frame = frame;
                [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgurl]];
                [scorllView addSubview:imageView];
        
            }
        
            self.pageController               = [UIPageControl new];
            self.pageController.frame         = CGRectMake(0, 120, SCREENWEIGHT, 10);
            self.pageController.currentPage   = 0;
            self.pageController.numberOfPages = imageArray.count;
            self.pageController.userInteractionEnabled = NO;
            [self addSubview:scorllView];
            [self addSubview:self.pageController];
        
        self.num = 0;
        if (!_timer) {
            
            _timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(chagePage) userInfo:nil repeats:YES];
            
            
        }
        
    }
    
       return self ;
}

-(void)chagePage{
    
    
    self.pageController.currentPage = self.num;
    _scrollView.contentOffset = CGPointMake(self.num*SCREENWEIGHT, 0);
    self.num++;

    if (self.num == self.count) {
        
        self.num = 0;
        

    }
    
    
}

+(void)invokeTimer{
    
    [_timer invalidate];
    _timer = nil;
    
    
}

+(void)destroyTimer{
    
    
    if (!_timer) {
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(chagePage) userInfo:nil repeats:YES];
        

    }
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    
    CGFloat floatX = scrollView.contentOffset.x;
    self.pageController.currentPage = round(floatX/SCREENWEIGHT);
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
