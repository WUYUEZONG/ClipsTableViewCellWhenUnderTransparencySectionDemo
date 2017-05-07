//
//  ViewController.m
//  ClipsTableViewCellWhenUnderTransparencySectionDemo
//
//  Created by WUYUEZONG on 2017/5/8.
//  Copyright © 2017年 WUYUEZONG. All rights reserved.
//

#import "ViewController.h"
#import "UITableViewCell+Extra.h"

static  NSString * TABLECELLIDENTIFIER = @"TABLECELLIDENTIFIER";

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 100)];
    view.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 100;
}

/// UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:TABLECELLIDENTIFIER];
    if (!tableViewCell) {
        tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TABLECELLIDENTIFIER];
        tableViewCell.backgroundColor  = [UIColor clearColor];
        tableViewCell.textLabel.font = [UIFont systemFontOfSize:12 weight:UIFontWeightLight];
        tableViewCell.textLabel.textColor = [UIColor whiteColor];
    }
    
    tableViewCell.textLabel.text = [NSString stringWithFormat:@"ClipsTableViewCellWhenUnderTransparencySection at %ld", indexPath.row];
    
    return tableViewCell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [_tableView.visibleCells enumerateObjectsUsingBlock:^(__kindof UITableViewCell * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        // cell和section覆盖的高度 = 需要剪去的高度 20是contentInset， 100是sectionHeight，再减去cell的y
        CGFloat hideCellHeight = scrollView.contentOffset.y + 20 + 100 - obj.frame.origin.y;
        
        CGRect maksFrame = obj.bounds;
        
        if (hideCellHeight > 0 && hideCellHeight <= obj.frame.size.height) {
            maksFrame =  CGRectMake(0, hideCellHeight, obj.frame.size.width, obj.frame.size.height - hideCellHeight);
        } else if (hideCellHeight > obj.frame.size.height) {
            maksFrame = CGRectZero;
        }
        [obj clipOutSideCellWhenUnderTransparencySectionSetMaskFrame:maksFrame];
        
    }];
    
}

@end
