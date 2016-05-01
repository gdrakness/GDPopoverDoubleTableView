//
//  GDCategoryModel.h
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <Foundation/Foundation.h>
/***********************分类************************/
/**
 *  项目模型
 */
@interface GDCategoryModel : NSObject
@property (nonatomic, copy) NSString *highlighted_icon;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *small_highlighted_icon;
@property (nonatomic, copy) NSString *small_icon;
@property (nonatomic, copy) NSString *map_icon;
@property (nonatomic, strong) NSArray<NSString *> *subcategories;
@end

/**
 *  分类模型
 */
@interface CategoryDataModel : NSObject
@property (nonatomic, strong) NSArray<GDCategoryModel *> *categories;
@end

/***********************地区************************/

@interface DistrictItemModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) NSArray<NSString *> *subdistricts;
@end

@interface CityItemModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *pinYin;
@property (nonatomic, copy) NSString *pinYinHead;
@property (nonatomic, strong) NSArray<DistrictItemModel *> *districts;
@end

@interface CityDataModel : NSObject
@property (nonatomic, strong) NSArray<CityItemModel *> *cities;
@end

/***********************城市************************/

@interface CityGroupItemModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<NSString *> *cities;
@end

@interface CityGroupDataModel : NSObject
@property (nonatomic, strong) NSArray<CityGroupItemModel *> *cityGroups;

@end