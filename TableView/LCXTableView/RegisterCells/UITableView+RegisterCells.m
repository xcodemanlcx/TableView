//
//  UITableView+LCXRegisterCells.m
//  TableView
//
//  Created by leichunxiang on 2019/10/28.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UITableView+RegisterCells.h"

@implementation UITableView (RegisterCells)

- (void)registerCellClasses:(NSArray <Class> *)classes{
    [self registerCellClasses:classes registerBlock:^(Class  _Nonnull __unsafe_unretained cls, NSString * _Nonnull reuseCellID) {
        [self registerClass:cls forCellReuseIdentifier:reuseCellID];
    }];
}

@end
