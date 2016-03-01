//
//  CLNewsCell.m
//  CarHome
//
//  Created by Aspmcll on 16/2/19.
//  Copyright © 2016年 Aspmcll. All rights reserved.
//

#import "CLNewsCell.h"
#import "CLNewsModel.h"
#import "UIImageView+WebCache.h"

@interface CLNewsCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImage;

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLable;
@property (weak, nonatomic) IBOutlet UILabel *replayCountLabel;

@end
@implementation CLNewsCell

-(void)setNewsModel:(CLNewsModel *)newsModel{
    
    _newsModel = newsModel;
    [self setViewMessage:newsModel];
    
    
}

-(void)setViewMessage:(CLNewsModel *)news{
   
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:news.smallpic] placeholderImage:[UIImage imageNamed:@"placeholder_deal"] completed:nil];
    self.contentLabel.text     = news.title;
    self.timeLable.text        = news.time;
    self.replayCountLabel.text = [NSString stringWithFormat:@"%@评论",news.replycount];
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end
