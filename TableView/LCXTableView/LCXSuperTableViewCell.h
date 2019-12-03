//
//  LCXSuperTableViewCell.h
//  TableView
//
//  Created by leichunxiang on 2019/10/28.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^CellActionBlock)(NSUInteger cellActionIndex);

@interface LCXSuperTableViewCell : UITableViewCell

@property (nonatomic, strong) id cellModel;
@property (nonatomic, copy) CellActionBlock cellActionBlock;

- (void)initCellView;

@end

NS_ASSUME_NONNULL_END
