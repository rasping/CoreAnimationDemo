//
//  ViewController.m
//  CoreAnimationDemo
//
//  Created by siping ruan on 17/1/20.
//  Copyright © 2017年 Rasping. All rights reserved.
//

//参考文章：https://github.com/AttackOnDobby/iOS-Core-Animation-Advanced-Techniques
//对图层的详尽介绍


#import "ViewController.h"
#import "CALayerVC.h"
#import "CAShapeLayerVC.h"
#import "CAGradientLayerVC.h"
#import "CATiledLayerVC.h"
#import "CATextLayerVC.h"
#import "CAReplicatorLayerVC.h"
#import "CAEmitterLayerVC.h"
#import "CAEAGLLayerVC.h"
#import "CATransformLayerVC.h"
#import <CoreMotion/CoreMotion.h>

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
            [self.navigationController pushViewController:[CATextLayerVC new] animated:YES];
            break;
        case 5:
            [self.navigationController pushViewController:[CATextLayerVC new] animated:YES];
            break;
        case 6:
            [self.navigationController pushViewController:[CAReplicatorLayerVC new] animated:YES];
            break;
        case 7:
            [self.navigationController pushViewController:[CAEmitterLayerVC new] animated:YES];
            break;
        case 8:
            [self.navigationController pushViewController:[CAEAGLLayerVC new] animated:YES];
            break;
        case 9:
            [self.navigationController pushViewController:[CATransformLayerVC new] animated:YES];
            break;
            
        default:
            break;
    }
}

@end
