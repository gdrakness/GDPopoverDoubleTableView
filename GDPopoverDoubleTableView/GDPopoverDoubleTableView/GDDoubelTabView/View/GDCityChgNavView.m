//
//  GDCityChgNavView.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/5/1.
//  Copyright © 2016年 gdarkness. All rights reserved.
//

#import "GDCityChgNavView.h"

@implementation GDCityChgNavView

+(instancetype)cityChangeNavView{
    
    return [[[NSBundle mainBundle]loadNibNamed:@"GDCityChgNavView" owner:nil options:nil]firstObject];
}

-(void)awakeFromNib{
    
    //不受autoresizing规则约束，大小不随父控件改变而改变
    self.autoresizingMask = UIViewAutoresizingNone;
}

@end
