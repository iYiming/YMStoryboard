//
//  YMCustomSegue.m
//  YMStoryboard
//
//  Created by Yiming on 14/11/30.
//  Copyright (c) 2014年 Henizaiyiqi. All rights reserved.
//

#import "YMCustomSegue.h"
#import "YMTextViewController.h"
@implementation YMCustomSegue

- (void)perform{
    UIViewController *current = self.sourceViewController;//源控制器
    YMTextViewController *next = self.destinationViewController;//目标控制器
    next.title = @"一段文字";
    [current.navigationController pushViewController:next animated:YES];//push
}

@end
