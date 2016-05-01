//
//  GDCategoryModel.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCategoryModel.h"

/***********************分类************************/
@implementation GDCategoryModel

@end

@implementation CategoryDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return  @{
              @"categories" : [GDCategoryModel class]
              };
}

@end

/***********************分类************************/

@implementation DistrictItemModel


@end

@implementation CityItemModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return  @{
              @"districts" : [DistrictItemModel class]
              };
}

@end

@implementation CityDataModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"cities" : [CityItemModel class]
             };
}

@end

/***********************分类************************/

@implementation CityGroupItemModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return  @{
              @"cityGroups" : [CityGroupItemModel class]
              };
}


@end