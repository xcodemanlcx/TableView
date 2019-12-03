//
//  TableViewController.m
//  TableViewAndCollectionView
//
//  Created by leichunxiang on 2019/12/3.
//  Copyright © 2019 lcx. All rights reserved.
//

#import "TableViewController.h"
#import "LCXTableViewDelegates.h"
#import "TableViewCell.h"
#import "TableViewTowCell.h"

@interface TableViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) LCXTableViewDelegates *tableViewDelegates;
@end

@implementation TableViewController

- (void)dealloc
{
    NSLog(@"dealloc %@",NSStringFromClass(self.class));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self tableView];
    
    NSMutableArray *modelArr = @[].mutableCopy;
    for (NSInteger i = 0; i< 20; i++) {
        LCXSuperListViewModel *model = [LCXSuperListViewModel new];
        model.cellHeight = 100;
        model.celllReuseIDIndex = i%2;
        [modelArr addObject:model];
    }
    _tableViewDelegates.dataArr = modelArr;
    [_tableView reloadData];
}

- (UITableView *)tableView{
    if (!_tableView) {
        
        //tableView delegate and dataSource
        _tableViewDelegates = [LCXTableViewDelegates new];
        __weak typeof (self) weakSelf = self;
        _tableViewDelegates.cellForRowBlock = ^(UITableView * _Nonnull tableView, UITableViewCell * _Nonnull cell, NSUInteger cellActionIndex) {
            
            NSLog(@"cellForRowBlock %lu,row == %lu",(unsigned long)cellActionIndex,[tableView indexPathForCell:cell].row);
            [weakSelf dismissViewControllerAnimated:YES completion:nil];
        };
        _tableViewDelegates.didSelectBlock = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull selectedIndexPath) {
            NSLog(@"didSelectBlock:%ld",(long)selectedIndexPath.row);
        };
        
        //tableView
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = _tableViewDelegates;
        _tableView.dataSource = _tableViewDelegates;
        [self.view addSubview:_tableView];
        [_tableView registerCellClasses:@[TableViewCell.class,TableViewTowCell.class]];
        
    }
    return _tableView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
