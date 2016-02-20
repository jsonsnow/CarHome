//
//  CLDetailViewController.m
//  CarHome
//
//  Created by Aspmcll on 16/2/20.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLDetailViewController.h"

@interface CLDetailViewController ()

@property (nonatomic,assign) NSInteger num;

@end

@implementation CLDetailViewController

-(instancetype)initWithNewsId:(NSInteger)num{
    
    if (self = [super init]) {
        
        _num = num;
        
    }
    
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIWebView *webView = [UIWebView new];
    webView.frame      = self.view.frame;
    [self.view addSubview:webView];
    NSString *path=[NSString stringWithFormat:@"http://cont.app.autohome.com.cn/autov5.0.0/content/news/newscontent-n%@-t0-rct1.json", _num];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
