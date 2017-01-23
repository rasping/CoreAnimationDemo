//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/1/20.
//  Copyright © 2017年 Rasping. All rights reserved.
//

#import "ViewController.h"
#import "CALayerVC.h"
#import "CAShapeLayerVC.h"
#import "CAGradientLayerVC.h"
#import "CATiledLayerVC.h"

@interface ViewController ()<UITableViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            [self.navigationController pushViewController:[CALayerVC new] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[CAShapeLayerVC new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[CAGradientLayerVC new] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[CATiledLayerVC new] animated:YES];
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        case 9:
            
            break;
            
        default:
            break;
    }
}

@end
