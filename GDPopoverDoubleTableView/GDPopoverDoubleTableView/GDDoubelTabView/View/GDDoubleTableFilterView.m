//
//  GDDoubleTableFilterView.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDoubleTableFilterView.h"

@implementation GDDoubleTableFilterViewCellInfo
@end

@interface GDDoubleTableFilterView ()<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableViewLeft;
@property (weak, nonatomic) IBOutlet UITableView *tableViewRight;

//左边选中的索引标记
@property (nonatomic, strong) NSIndexPath *leftSelectedIndexPath;

@end

@implementation GDDoubleTableFilterView

+(instancetype)doubleTableFilterView{
    return [[[NSBundle mainBundle]loadNibNamed:@"GDDoubleTableFilterView" owner:nil options:nil]firstObject];
}

-(void)awakeFromNib{
    
    //不受autoresizing规则约束，大小不随父控件的改变而改变
    self.autoresizingMask = UIViewAutoresizingNone;
}

#pragma mark  -- tableView数据源和代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([tableView isEqual:self.tableViewLeft]) {
        
        if ([self.dataSource respondsToSelector:@selector(numberOfRowsForLeftTableView)]) {
            return [self.dataSource numberOfRowsForLeftTableView];
        }else{
            return 0;
        }
    }
    
    if ([self.dataSource respondsToSelector:@selector(doubleTableView:numberOfRowsForRightTableViewLeftSelectedIndexPath:)]) {
        
        return [self.dataSource doubleTableView:self numberOfRowsForRightTableViewLeftSelectedIndexPath:self.leftSelectedIndexPath];
    }else{
        return  0;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *indentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifier];
    
    if (!cell) {
      
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifier];
    }
    
    //判断是左边还是右边
    BOOL isLeft = [tableView isEqual:self.tableViewLeft];
    
    GDDoubleTableFilterViewCellInfo *cellInfo = nil;
    
    if ([self.dataSource respondsToSelector:@selector(doubleTableView:cellInfoForIndexPath:isLeft:leftSelectedIndexPath:)]) {
        
        //向数据源索取数据
        cellInfo = [self.dataSource doubleTableView:self cellInfoForIndexPath:indexPath isLeft:isLeft leftSelectedIndexPath:self.leftSelectedIndexPath];
    }
    
    //赋值数据
    cell.textLabel.text = cellInfo.title;
    
    //如果有图标
    if (cellInfo.imageName) {
        
        //普通状态
        cell.imageView.image = [UIImage imageNamed:cellInfo.imageName];
        //高亮状态
        cell.imageView.highlightedImage = [UIImage imageNamed:cellInfo.imageNameH];
    }
        //箭头
        cell.accessoryType = cellInfo.isShowArrow ? UITableViewCellAccessoryDisclosureIndicator :UITableViewCellAccessoryNone;
        
        //背景
        if (isLeft) {
            
            //普通状态下背景
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_leftpart"]];
            cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_left_selected"]];
        }else{
            
            //右边
            cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_rightpart"]];
            cell.selectedBackgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg_dropdown_right_selected"]];
        }
        return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSIndexPath *resultIndexPath = nil;
    
    //记录左边选中的索引
    if ([tableView isEqual:self.tableViewLeft]) {
        
        /***********************选中了左边************************/
        self.leftSelectedIndexPath = indexPath;
        //构建选中结果索引
        resultIndexPath = [NSIndexPath indexPathForRow:0 inSection:indexPath.row];
        
        //刷新右边的数据
        [self.tableViewRight reloadData];
    }else{
        
        /***********************选中了右边************************/
        //构建选中结果索引
        resultIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:self.leftSelectedIndexPath.row];
        
    }
    
    //判断是否实现代理方法
    if ([self.delegate respondsToSelector:@selector(doubleTableView:didSelectedResultIndexPath:)]) {
        
        //回调代理方法，告知选中的结果
        [self.delegate doubleTableView:self didSelectedResultIndexPath:resultIndexPath];
        
    }
}
@end
