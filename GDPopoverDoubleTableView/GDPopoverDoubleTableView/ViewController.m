//
//  ViewController.m
//  GDPopoverDoubleTableView
//
//  Created by gdarkness on 16/5/2.
//  Copyright © 2016年 gdarkness. All rights reserved.
//


#import "ViewController.h"
#import "GDCategoryFilterPopoverVC.h"
#import "GDRegionFilterPopoverVCViewController.h"
#import "UIView+GDSize.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    [self setupNavBar];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupNavBar{
    
    UIButton * button = [[UIButton alloc]init];
    
    [button setImage:[UIImage imageNamed:@"icon_cell_rightArrow_selected"] forState:UIControlStateNormal];
    button.width = 44;
    button.height = 44;
    
    UIButton *buttonSecond = [[UIButton alloc]init];
    [buttonSecond setImage:[UIImage imageNamed:@"icon_cell_rightArrow_disabled"] forState:UIControlStateNormal];
    buttonSecond.width = 44;
    buttonSecond.height = 44;
    
    [buttonSecond addTarget:self action:@selector(test2:) forControlEvents:UIControlEventTouchUpInside];
    [button addTarget:self action:@selector(test:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *firstItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    UIBarButtonItem *secondItem = [[UIBarButtonItem alloc]initWithCustomView:buttonSecond];
    
    self.navigationItem.leftBarButtonItems = @[firstItem,secondItem];
}

-(void)test:(id)sender{
    
    NSLog(@"%s", __func__);
    
    //创建控制器
    GDCategoryFilterPopoverVC *categoryFilterPopoverVC = [[GDCategoryFilterPopoverVC alloc]init];
    
    //设置呈现方式为popover
    categoryFilterPopoverVC.modalPresentationStyle = UIModalPresentationPopover;
    
    //设置箭头
    categoryFilterPopoverVC.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItems[0];
    
    [self presentViewController:categoryFilterPopoverVC animated:YES completion:nil];
    
    
    
}

-(void)test2:(id)sender{
    
    //创建控制器
    GDRegionFilterPopoverVCViewController *regionFilterPopoverVC = [[GDRegionFilterPopoverVCViewController alloc]init];
    
    //设置呈现方式为popover
    regionFilterPopoverVC.modalPresentationStyle = UIModalPresentationPopover;
    
    //设置箭头
    regionFilterPopoverVC.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItems[1];
    
    [self presentViewController:regionFilterPopoverVC animated:YES completion:nil];
}

@end
