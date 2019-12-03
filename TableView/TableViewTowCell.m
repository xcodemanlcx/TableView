//
//  TableViewTowCell.m
//  TableViewAndCollectionView
//
//  Created by leichunxiang on 2019/12/3.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "TableViewTowCell.h"

@implementation TableViewTowCell

- (void)initCellView{
    self.contentView.backgroundColor = [UIColor orangeColor];
    for (NSInteger i = 0; i < 2; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(10+150*i, 20, 100, 60);
        btn.tag = 100+i;
        btn.backgroundColor = [UIColor redColor];
        [btn setTitle:[NSString stringWithFormat:@"btn%ld",(long)i] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
}

- (void)btnAction:(UIButton *)sender{
    if (self.cellActionBlock) {
        self.cellActionBlock(sender.tag -100);
    }
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
