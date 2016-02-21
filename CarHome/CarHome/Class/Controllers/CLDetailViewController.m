//
//  CLDetailViewController.m
//  CarHome
//
//  Created by Aspmcll on 16/2/20.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLDetailViewController.h"
#import "UIBarButtonItem+CLBlock.h"

@interface CLDetailViewController ()

@property (nonatomic,assign) NSNumber * num;

@end

@implementation CLDetailViewController

-(instancetype)initWithNewsId:(NSNumber *)num{
    
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
    NSLog(@"%@",path);
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:path]];
    [webView loadRequest:request];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonWithTiele:@"返回" andType:UIBarButtonItemStyleDone andBlock:^(UIBarButtonItem *barButton) {
       
        [self dismissViewControllerAnimated:YES completion:nil];
        
    }];
    
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
