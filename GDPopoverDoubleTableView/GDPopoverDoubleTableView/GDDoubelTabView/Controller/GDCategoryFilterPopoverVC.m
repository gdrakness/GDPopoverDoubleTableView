//
//  GDCategoryFilterPopoverVC.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/5/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCategoryFilterPopoverVC.h"
#import "GDDoubleTableFilterView.h"
#import "GDDataManager.h"
#import "UIView+GDSize.h"

@interface GDCategoryFilterPopoverVC ()<GDDoubleTableFilterViewDataSource,GDDoubleTableFilterViewDelegate>

@end

@implementation GDCategoryFilterPopoverVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createView{
    
    //从xib创建双tableView
    GDDoubleTableFilterView *doubleTableView = [GDDoubleTableFilterView doubleTableFilterView];
    doubleTableView.dataSource = self;
    doubleTableView.delegate = self;
    
    [self.view addSubview:doubleTableView];
    
    //设置内容尺寸
    self.preferredContentSize = doubleTableView.size;
}

-(NSInteger)numberOfRowsForLeftTableView{
    
    //取出数据
    CategoryDataModel *categoryDataModel = [[GDDataManager shareInstance]getCategoryData];
    
    return categoryDataModel.categories.count;
}

-(NSInteger)doubleTableView:(GDDoubleTableFilterView *)doubleTableView numberOfRowsForRightTableViewLeftSelectedIndexPath:(NSIndexPath *)indexPath{
    
    //取出数据
    CategoryDataModel *categoryDataModel =[[GDDataManager shareInstance]getCategoryData];
    
    //取出左边对应索引下的数据
   GDCategoryModel *categoryItem = categoryDataModel.categories[indexPath.row];
    
    return categoryItem.subcategories.count;
}

-(GDDoubleTableFilterViewCellInfo *)doubleTableView:(GDDoubleTableFilterView *)doubleTableView cellInfoForIndexPath:(NSIndexPath *)indexPath isLeft:(BOOL)isLeft leftSelectedIndexPath:(NSIndexPath *)leftIndexPath{
    
    //创建cell数据模型
    GDDoubleTableFilterViewCellInfo *cellInfo = [[GDDoubleTableFilterViewCellInfo alloc]init];
    
    //取出数据
    CategoryDataModel *categoryDataModel = [[GDDataManager shareInstance]getCategoryData];
    
    if (isLeft) {
        
        /***********************左边************************/
        //取出左边模型数据
        GDCategoryModel *categoryItem = categoryDataModel.categories[indexPath.row];
        
        //赋值cell 数据
        cellInfo.title = categoryItem.name;
        cellInfo.imageName = categoryItem.icon;
        cellInfo.imageNameH = categoryItem.highlighted_icon;
        cellInfo.isShowArrow = categoryItem.subcategories.count ? YES : NO;
        
    }else{
      
        /***********************右边************************/
        GDCategoryModel *categroyItem = categoryDataModel.categories[leftIndexPath.row];
        
        cellInfo.title = categroyItem.subcategories[indexPath.row];
    }
    
    return cellInfo;
}

#pragma mark -- GDDoubleTableFilterViewDelegate

-(void)doubleTableView:(GDDoubleTableFilterView *)doubleTableView didSelectedResultIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"选中: %ld - %ld",indexPath.section, indexPath.row);
}


@end
