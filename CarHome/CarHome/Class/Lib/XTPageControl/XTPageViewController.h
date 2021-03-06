//
//  XTPageViewController.h
//  XTPageControl
//
//  Created by imchenglibin on 16/1/26.
//  Copyright © 2016年 xt. All rights reserved.
//  https://github.com/imchenglibin/XTPageControl
//

#import <UIKit/UIKit.h>
#import "XTTabBarStyle.h"

@protocol XTPageViewControllerDataSource <NSObject>

//the number of pages
- (NSInteger)numberOfPages;

//the title for the page
- (NSString*)titleOfPage:(NSInteger)page;

//the controller for the page

- (UIViewController*)constrollerOfPage:(NSInteger)page;


@end


@interface XTPageViewController : UIViewController

//init with tabBar style
//if you use init, initWithCoder, initWithNibName the default style is XTTabBarStyleCursorUnderline
- (instancetype)initWithTabBarStyle:(XTTabBarStyle)style;

//the data source of XTPageViewController
@property (weak, nonatomic) id<XTPageViewControllerDataSource> dataSource;


//customize the left item view of XTPageViewController, defaul will be nil
@property (strong, nonatomic) UIView *tabBarLeftItemView;

//customize the right item view of XTPageViewController, defaul will be nil
@property (strong, nonatomic) UIView *tabBarRightItemView;

//customize the tabBar title color
@property (strong, nonatomic) UIColor *tabBarTitleColorNormal;

//customize the tabBar title color when selected
@property (strong, nonatomic) UIColor *tabBarTitleColorSelected;

//customize the tabBar cursor color
@property (strong, nonatomic) UIColor *tabBarCursorColor;

//customize the tabBar height
@property (assign, nonatomic) CGFloat tabBarHeight;

//customize the tabBar background color
@property (strong, nonatomic) UIColor *tabBarBackgroundColor;

//use this property to force the tabBar items aligment left
@property (assign, nonatomic) BOOL forceLeftAligment;

@end
// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com