//
//  HomeTableViewCell.m
//  basicFramework
//
//  Created by jefactoria on 17/1/11.
//  Copyright © 2017年 xiexing. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)addChildView{

    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH - 40, 40)];
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    self.titleLabel.textColor = purple_color;
    [self addSubview:self.titleLabel];

}
-(void)cellAutoLayoutHeight:(NSString *)title{
    
    CGSize size = [self.titleLabel.text sizeWithAttributes:@{ NSFontAttributeName: self.titleLabel.font }];
    //cell高度
    CGRect frame = [self frame];
    frame.size.height  = size.height;
    self.frame = frame;

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
