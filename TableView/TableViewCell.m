//
//  TableViewCell.m
//  TableViewAndCollectionView
//
//  Created by leichunxiang on 2019/12/3.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)initCellView{
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 60)];
    lab.text = @"first cell";
    [self.contentView addSubview:lab];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
