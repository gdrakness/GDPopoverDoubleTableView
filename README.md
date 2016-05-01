# GDPopoverDoubleTableView
double tableView for iPad

![image](https://github.com/gdrakness/GDPopoverDoubleTableView/blob/master/GDPopoverDoubleTableView.gif)

#Usage

First of all to GDDoubelTabView file into the project

Need to increase the import

```
    #import "GDCategoryFilterPopoverVC.h"
    #import "GDRegionFilterPopoverVCViewController.h"
    
    GDCategoryFilterPopoverVC *categoryFilterPopoverVC = [[GDCategoryFilterPopoverVC alloc]init];
    
    categoryFilterPopoverVC.modalPresentationStyle = UIModalPresentationPopover;
    
    categoryFilterPopoverVC.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItems[0];
    
    [self presentViewController:categoryFilterPopoverVC animated:YES completion:nil];
    
```
City selector

```
    GDRegionFilterPopoverVCViewController *regionFilterPopoverVC = [[GDRegionFilterPopoverVCViewController alloc]init];
    
    regionFilterPopoverVC.modalPresentationStyle = UIModalPresentationPopover;
    
    regionFilterPopoverVC.popoverPresentationController.barButtonItem = self.navigationItem.leftBarButtonItems[1];
    
    [self presentViewController:regionFilterPopoverVC animated:YES completion:nil];
```
