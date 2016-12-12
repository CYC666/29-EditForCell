//
//  NewController.m
//  EditForCell
//
//  Created by mac on 16/12/12.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "NewController.h"

@interface NewController () <UITableViewDelegate, UITableViewDataSource> {

    NSMutableArray *_mArray;
    UITableView *_tableView;
    BOOL _isEdit;

}

@end

@implementation NewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:@"编辑"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(editAction:)];
    [self.navigationItem setRightBarButtonItem:button1];
    
    
    _mArray = [NSMutableArray arrayWithArray:@[@"曹操",@"王豪",@"韦德",@"周恩来",@"吕布",@"王维",@"文森特",@"剑圣"]];
    
    _tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _mArray.count;

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = _mArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 70;

}




#pragma mark - 表视图编辑模式下的协议方法
// 是否允许单元格编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

    return YES;

}

// 设置左滑右边显示的标题
- (nullable NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {

    return @"删除";

}

// 允许单元格移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
// 单元格移动
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    //1、取出单元格
    id moveData = [_mArray objectAtIndex:sourceIndexPath.row];
    //2、删除对应位置数据
    [_mArray removeObjectAtIndex:sourceIndexPath.row];
    //3、把取出的数据插到新位置
    [_mArray insertObject:moveData atIndex:destinationIndexPath.row];
}

// 设置单元格的编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

    /*
     UITableViewCellEditingStyleNone,
     UITableViewCellEditingStyleDelete,
     UITableViewCellEditingStyleInsert
     */
    
    if (indexPath.row/3 == 0) {
        return UITableViewCellEditingStyleNone;
    } else if (indexPath.row/3 == 1) {
        return UITableViewCellEditingStyleDelete;
    } else {
        return UITableViewCellEditingStyleInsert;
    }

}

// 当表视图在编辑模式时，会调用以下方法
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {

    /*
     UITableViewCellEditingStyleNone,
     UITableViewCellEditingStyleDelete,
     UITableViewCellEditingStyleInsert
     */
    
    if (editingStyle == UITableViewCellEditingStyleNone) {
        return;
    } else if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_mArray removeObjectAtIndex:indexPath.row];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        [_mArray insertObject:[NSString stringWithFormat:@"%d", arc4random()%10] atIndex:indexPath.row];
    }
    
    [_tableView reloadData];

}






#pragma mark - 私有方法
- (void)editAction:(UIBarButtonItem *)item {

    _isEdit = !_isEdit;
    if (_isEdit == YES) {
        item.title = @"完成";
        [_tableView setEditing:YES];
    } else {
        item.title = @"编辑";
        [_tableView setEditing:NO];
    }
    

}

#pragma mark - 改变状态栏

- (UIStatusBarStyle)preferredStatusBarStyle {

    return UIStatusBarStyleLightContent;

}



























@end
