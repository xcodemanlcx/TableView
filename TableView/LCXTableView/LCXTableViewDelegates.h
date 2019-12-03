//
//  LCXTableViewDelegates.h
//  TableView
//
//  Created by leichunxiang on 2019/10/29.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LCXSuperTableViewCell.h"
#import "UITableView+RegisterCells.h"
#import "LCXSuperListViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LCXTableViewDelegates : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

#pragma mark - block
@property (nonatomic, copy) void(^cellForRowBlock)(UITableView *tableView, UITableViewCell * cell,NSUInteger cellActionIndex);
@property (nonatomic, copy) void(^didSelectBlock)(UITableView *tableView, NSIndexPath * selectedIndexPath);

@end

NS_ASSUME_NONNULL_END
