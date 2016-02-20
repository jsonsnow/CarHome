//
//  CLNewsViewController.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLNewsViewController.h"
#import "CLNewsTool.h"
#import "CLNewsModel.h"
#import "CLNewsCell.h"
#import "MJRefresh.h"
#import "CLHeaderView.h"

@interface CLNewsViewController ()

@property (nonatomic,strong) NSMutableArray *newsArray;
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) NSString *stringTime;
@property (nonatomic,strong) NSArray *headerArray;

@end

@implementation CLNewsViewController

-(NSMutableArray *)newsArray{
    
    
    if (!_newsArray) {
        
        _newsArray = [NSMutableArray array];
    }
    
    return _newsArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.page = 1;
    self.stringTime = @"0";
    [self loadNewsMessage];
    [self loadLatestNews];
    [self loadMoreNews];
    
}

#pragma mark -load message,LatestMessage,MoreMessage
-(void)loadLatestNews{
    
    self.tableView.mj_header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
       
        [[CLNewsTool shareNewsTool] getNews:self.num withTime:self.stringTime withPage:1 withSuccessBlock:^(NSArray *array) {
            
            NSAssert([NSThread isMainThread], @"update ui must in mainThread");
            CLNewsModel *model   = self.newsArray[0];
            self.stringTime      = model.updatetime;
            self.tableView.mj_header.lastUpdatedTimeKey = self.stringTime;
        
            if (array.count==0||array==nil) {
                
                NSLog(@"获取数据失败");
                [self.tableView.mj_header endRefreshing];
                return ;
            }
            CLNewsModel *lasterNews = array[0];
            if ([model.newsId isEqualToNumber:lasterNews.newsId]) {
                NSLog(@"无新的数据");
                [self.tableView.mj_header endRefreshing];
                lasterNews = nil;
                return ;
                
            }
            
            NSMutableArray *insetArray = [NSMutableArray array];
            for (int i = 0; i<array.count; i++) {
                
                CLNewsModel *newsModel = array[i];
                [self.newsArray insertObject:newsModel atIndex:i];
                NSIndexPath *indexPath = [NSIndexPath indexPathForRow:i inSection:0];
                [insetArray addObject:indexPath];
                
                if ([newsModel.newsId isEqualToNumber:model.newsId]) {
                    
                    break ;
                }
                
                
            }
            
            
            [self.tableView.mj_header endRefreshing];
            [self.tableView insertRowsAtIndexPaths:insetArray withRowAnimation:UITableViewRowAnimationNone];

        } withFailerBlock:^(NSURLResponse *response, NSError *error) {
            
             [self.tableView.mj_header endRefreshing];
            
            
        } withHeaderBlock:^(NSArray *array) {
            
                        //[self.tableView.mj_header addSubview:[CLHeaderView createHeagerView:array]];
            
            
        } ];
        
        
    }];
    
}
-(void)loadMoreNews{
    
   self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
      
       self.page = self.page +1;
       [[CLNewsTool shareNewsTool] getNews:self.num withTime:self.stringTime withPage:self.page withSuccessBlock:^(NSArray *array) {
           
           if (array.count==0||array==nil) {
               
               [self.tableView.mj_footer endRefreshingWithNoMoreData];
               return ;
           }
           
           NSAssert([NSThread isMainThread], @"update ui must in mainThread");
           [self.newsArray addObjectsFromArray:array];
           [self.tableView reloadData];
           [self.tableView.mj_footer endRefreshing];

           
       } withFailerBlock:^(NSURLResponse *response, NSError *error) {
           
            [self.tableView.mj_footer endRefreshing];
           
           
       } withHeaderBlock:^(NSArray *array) {
           
           
       }];

       
   }];

    //[self.tableView.mj_footer beginRefreshing];

}

-(void)loadNewsMessage{
    
    
    __weak  typeof(CLNewsViewController) *mySelf = self;
    [[CLNewsTool shareNewsTool] getNews:self.num withTime:self.stringTime withPage:self.page withSuccessBlock:^(NSArray *array) {
        
        [mySelf.newsArray addObjectsFromArray:array];
        [mySelf.tableView reloadData];
        
    } withFailerBlock:^(NSURLResponse *response, NSError *error) {
        
          NSLog(@"加载失败");
        
    } withHeaderBlock:^(NSArray *array) {
        
        
        if (array.count>0) {
            
            UIView *view = [UIView new];
            view.frame =CGRectMake(0, 0, 320, 100);
            view.backgroundColor = [UIColor grayColor];
            UIScrollView *sv = [UIScrollView new];
            sv.frame = view.frame;
            [view addSubview:sv];
            self.tableView.tableHeaderView = view;
//            [self  tableView:self.tableView viewForHeaderInSection:0];
//            [self  tableView:self.tableView heightForHeaderInSection:0];

        }
        [self configurHeaderView:array];
        
    } ];
      
            
}

#pragma mark - configure header view
-(void)configurHeaderView:(NSArray *)array{
    
    self.tableView.tableHeaderView = [CLHeaderView createHeagerView:array];
    self.tableView.tableHeaderView.frame = CGRectMake(0, 0, self.tableView.frame.size.width, 100);
    
}

#pragma mark -销毁定时器
-(void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
//    if (self.tableView.tableHeaderView) {
//        
//        //[CLHeaderView invokeTimer];
//    }
    
}

-(void)viewWillDisappear:(BOOL)animated{
    
    
    [super viewWillDisappear:animated];
    
//    if (self.tableView.tableHeaderView) {
//        
//        //[CLHeaderView destroyTimer];
//    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.newsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CLNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CLNewsModel *news    = self.newsArray[indexPath.row];
    CLNewsCell *newsCell =(CLNewsCell *) cell;
    newsCell.newsModel   = news;
    
}

#pragma mark  - configuer scroview

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//    if (self.headerArray==nil) {
//        
//        return 0;
//    }
//    
////    if (self.headerArray.count>0) {
////        
////        return 100;
////    }
//    
//    return 100;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    
//        
//        
//        return [CLHeaderView createHeagerView:self.headerArray];
//   
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
}



@end
