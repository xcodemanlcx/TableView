//
//  UIView+RegisterCells.m
//  TableViewAndCollectionView
//
//  Created by leichunxiang on 2019/12/2.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "UIView+RegisterCells.h"
#import <objc/runtime.h>

static NSString *const LCXCellIDSuffix = @"_reuseID";

@implementation UIView (RegisterCells)

@dynamic cellReuseIdentifiers;

- (NSMutableArray<NSString *> *)cellReuseIdentifiers{
    id mArr = objc_getAssociatedObject(self, @selector(cellReuseIdentifiers));
    if (!mArr) {
        mArr = @[].mutableCopy;
        objc_setAssociatedObject(self, _cmd, mArr, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return mArr;
}

- (void)registerCellClasses:(NSArray <Class> *)classes registerBlock:(void(^)(Class cls,NSString *reuseCellID))registerBlock{    if (classes && [classes isKindOfClass:NSArray.class] && registerBlock){
        for (NSUInteger i = 0; i<classes.count ; i++) {
            NSString *cellReuseIdentifier = [NSStringFromClass(classes[i]) stringByAppendingString:LCXCellIDSuffix];
            registerBlock(classes[i],cellReuseIdentifier);
            [self.cellReuseIdentifiers addObject:cellReuseIdentifier];
        }
    }
}

@end
