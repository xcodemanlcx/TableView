//
//  UIView+RegisterCells.h
//  TableViewAndCollectionView
//
//  Created by leichunxiang on 2019/12/2.
//  Copyright © 2019 lcx. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (RegisterCells)

@property (nonatomic, strong, readonly) NSMutableArray <NSString *> *cellReuseIdentifiers;

- (void)registerCellClasses:(NSArray <Class> *)classes registerBlock:(void(^)(Class cls,NSString *reuseCellID))registerBlock;

@end

NS_ASSUME_NONNULL_END
