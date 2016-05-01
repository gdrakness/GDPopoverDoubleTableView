//
//  GDRegionFilterPopoverVCViewController.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/5/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDRegionFilterPopoverVCViewController.h"
#import "GDDoubleTableFilterView.h"
#import "GDCityChgNavView.h"
#import "GDDataManager.h"
#import "UIView+GDSize.h"

@interface GDRegionFilterPopoverVCViewController ()<GDDoubleTableFilterViewDataSource,GDDoubleTableFilterViewDelegate>

@end

@implementation GDRegionFilterPopoverVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createView{
    
    //切换城市
    GDCityChgNavView *cityChangeView = [GDCityChgNavView cityChangeNavView];
    [self.view addSubview:cityChangeView];
    
    //双tableView
    GDDoubleTableFilterView *doubleTableView = [GDDoubleTableFilterView doubleTableFilterView];
    doubleTableView.y = cityChangeView.height;
    
    //数据源和代理
    doubleTableView.dataSource = self;
    doubleTableView.delegate = self;
    
    [self.view addSubview:doubleTableView];
    
    //设置内容尺寸
    self.preferredContentSize = CGSizeMake(doubleTableView.width, CGRectGetMaxY(doubleTableView.frame));
    
}

-(NSInteger)numberOfRowsForLeftTableView{
    
    //取出一个城市数据
    CityItemModel *cityItem = [[GDDataManager shareInstance]getCityItemDataWithCityName:@"珠海"];
    
    //左边区域数
    return cityItem.districts.count;
    
}

-(NSInteger)doubleTableView:(GDDoubleTableFilterView *)doubleTableView numberOfRowsForRightTableViewLeftSelectedIndexPath:(NSIndexPath *)indexPath{
    
    //取出一个城市数据
    CityItemModel *cityItem = [[GDDataManager shareInstance]getCityItemDataWithCityName:@"珠海"];
    
    //左边选中的区域
    DistrictItemModel *districtItem = cityItem.districts[indexPath.row];
    
    return districtItem.subdistricts.count;
}

-(GDDoubleTableFilterViewCellInfo *)doubleTableView:(GDDoubleTableFilterView *)doubleTableView cellInfoForIndexPath:(NSIndexPath *)indexPath isLeft:(BOOL)isLeft leftSelectedIndexPath:(NSIndexPath *)leftIndexPath{
    
    //取出一个城市数据
    CityItemModel *cityItem = [[GDDataManager shareInstance]getCityItemDataWithCityName:@"珠海"];
    
    //创建cell数据模型
    GDDoubleTableFilterViewCellInfo *cellInfo = [[GDDoubleTableFilterViewCellInfo alloc]init];
    
    if (isLeft) {
        
        /***********************左边************************/
        
        //取出左边区域Item
        DistrictItemModel *districtItem = cityItem.districts[indexPath.row];
        
        //赋值数据
        cellInfo.title = districtItem.name;
        
        //是否显示箭头，如果该区域里有子区域，则显示
        cellInfo.isShowArrow = districtItem.subdistricts.count ? YES : NO;
        
    }else{
        
        /***********************右边************************/
        //取出左边区域item
        DistrictItemModel *districtItem = cityItem.districts[leftIndexPath.row];
        
        //赋值数据
        cellInfo.title = districtItem.subdistricts[indexPath.row];
        
    }
    
    return cellInfo;
}

#pragma mark -- DoubleTableFilterViewDelegate

-(void)doubleTableView:(GDDoubleTableFilterView *)doubleTableView didSelectedResultIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"区域选中了: %ld - %ld", indexPath.section,indexPath.row);
}

@end
