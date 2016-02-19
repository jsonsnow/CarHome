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

@interface CLNewsViewController ()

@property (nonatomic,strong) NSMutableArray *newsArray;

@end

@implementation CLNewsViewController

-(NSMutableArray *)newsArray{
    
    
    if (!_newsArray) {
        
        _newsArray = [NSMutableArray array];
    }
    
    return _newsArray;
}

//-(instancetype)initWithType:(NSInteger)num{
//    
//    if (self = [super init]) {
//        
//        _num = num;
//    }
//    
//    return self ;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadNewsMessage];
}

-(void)loadNewsMessage{
    
    [[CLNewsTool shareNewsTool] getNews:self.num withTime:@"0" withPage:1 withSuccessBlock:^(NSArray *array) {
        
        [self.newsArray addObjectsFromArray:array];
        [self.tableView reloadData];
        
    } withFailerBlock:^(NSURLResponse *response, NSError *error) {
       
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    
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



@end
