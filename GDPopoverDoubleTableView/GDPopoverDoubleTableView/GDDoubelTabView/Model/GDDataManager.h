//
//  GDDataManager.h
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCategoryModel.h"
#import "GDCategoryModel.h"

@interface GDDataManager : NSObject

+(instancetype)shareInstance;
/**
 *  获取分类模型数据
 */
-(CategoryDataModel *)getCategoryData;

/**
 *  获取所有城市模型数据
 */
-(CityDataModel *)getCityData;

/**
 *  根据城市名获取城市数据模型
 */
-(CityItemModel *)getCityItemDataWithCityName:(NSString *)cityName;
@end
