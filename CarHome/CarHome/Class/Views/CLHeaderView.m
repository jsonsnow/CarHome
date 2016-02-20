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
@interface CLHeaderView ()<UIScrollViewDelegate>

@property (nonatomic,strong) UIPageControl *pageController;
@property (nonatomic,assign) NSInteger count;

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
            self.count = imageArray.count;
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

        
    }
    
       return self ;
}

//-(void)chagePage{
//    
//    if (self.pageController.currentPage<self.count) {
//        
//        self.pageController.currentPage = self.pageController.currentPage + 1;
//        [_scorlView scrollRectToVisible:CGRectMake(0, self.pageController.currentPage*SCREENWEIGHT, SCREENWEIGHT, 100) animated:YES];
//        
//    } else {
//        
//        self.pageController.currentPage = 0;
//    }
//    
//    
//}

+(void)invokeTimer{
    
    
    
    
}

+(void)destroyTimer{
    
    
    
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
