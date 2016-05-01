//
//  GDDataManager.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDDataManager.h"
#import "YYModel.h"
@implementation GDDataManager

+(instancetype)shareInstance{
    static id instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    
    return instance;
}

-(CategoryDataModel *)getCategoryData{
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"categories.plist" ofType:nil];
    
    NSDictionary *categoriesDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return [CategoryDataModel yy_modelWithJSON:categoriesDic];
}

-(CityDataModel *)getCityData{
    
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"cities.plist" ofType:nil];
    
    NSDictionary *citiesDic = [NSDictionary dictionaryWithContentsOfFile:filePath];
    
    return [CityDataModel yy_modelWithJSON:citiesDic];
}

-(CityItemModel *)getCityItemDataWithCityName:(NSString *)cityName{
    
    //去所有城市数据里查找，返回对应的城市
    CityDataModel *cityData = [self getCityData];
    
    for (CityItemModel *cityItem in cityData.cities) {
        
        if ([cityItem.name containsString:cityName]) {
            
            return cityItem;
        }
    }
    
    return nil;
}
@end
