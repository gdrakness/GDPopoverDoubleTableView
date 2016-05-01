//
//  GDDoubleTableFilterView.h
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/4/30.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GDDoubleTableFilterView;

/**
 *  cell数据模型
 */

@interface GDDoubleTableFilterViewCellInfo : NSObject

@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *imageNameH;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isShowArrow;

@end

@protocol GDDoubleTableFilterViewDataSource <NSObject>

@required

/**
 *  左边tableView显示的行数
 */
-(NSInteger)numberOfRowsForLeftTableView;

-(NSInteger)doubleTableView:(GDDoubleTableFilterView *)doubleTableView numberOfRowsForRightTableViewLeftSelectedIndexPath:(NSIndexPath *)indexPath;

-(GDDoubleTableFilterViewCellInfo *)doubleTableView:(GDDoubleTableFilterView *)doubleTableView cellInfoForIndexPath:(NSIndexPath *)indexPath isLeft:(BOOL)isLeft leftSelectedIndexPath:(NSIndexPath *)leftIndexPath;

@end

@protocol GDDoubleTableFilterViewDelegate <NSObject>

/**
 *  选中的结果
 */
-(void)doubleTableView:(GDDoubleTableFilterView *)doubleTableView didSelectedResultIndexPath:(NSIndexPath *)indexPath;

@end

@interface GDDoubleTableFilterView : UIView

//数据源
@property (nonatomic, weak) id <GDDoubleTableFilterViewDataSource> dataSource;
//代理
@property (nonatomic, weak) id <GDDoubleTableFilterViewDelegate> delegate;

+(instancetype)doubleTableFilterView;

@end
