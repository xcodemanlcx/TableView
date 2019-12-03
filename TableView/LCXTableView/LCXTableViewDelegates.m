//
//  LCXTableViewDelegates.m
//  TableView
//
//  Created by leichunxiang on 2019/10/29.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "LCXTableViewDelegates.h"


@implementation LCXTableViewDelegates

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCXSuperListViewModel *model = _dataArr[indexPath.row];
    LCXSuperTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableView.cellReuseIdentifiers[model.celllReuseIDIndex]];
    cell.cellModel = _dataArr[indexPath.row];
    if (_cellForRowBlock&&!cell.cellActionBlock) {
        __weak typeof(self) weakSelf = self;
        __weak typeof(cell) weakCell = cell;
        cell.cellActionBlock = ^(NSUInteger cellActionIndex) {
            __strong typeof (weakSelf) strongSelf = weakSelf;
            __strong typeof(weakCell) strongCell = weakCell;
            if (strongSelf.cellForRowBlock) {
                strongSelf.cellForRowBlock(tableView, strongCell, cellActionIndex);
            }
        };
    }
    return cell;
}

#pragma mark - UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    LCXSuperListViewModel *model = _dataArr[indexPath.row];
    return model.cellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_didSelectBlock) {
        _didSelectBlock(tableView,indexPath);
    }
}

#pragma mark - dataArr

- (void)setDataArr:(NSMutableArray *)dataArr{
    if (dataArr.count > 0) {
        _dataArr = dataArr;
    }else{
        _dataArr = nil;
    }
}
@end
