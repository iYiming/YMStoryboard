//
//  YMAddOrModifyViewController.h
//  YMStoryboard
//
//  Created by Yiming on 14/11/30.
//  Copyright (c) 2014年 Henizaiyiqi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    YMEditTypeAdd,
    YMEditTypeModify
}YMEditType;

@interface YMAddOrModifyViewController : UIViewController

@property (nonatomic,strong) NSString *textStr;
@property (nonatomic,assign) YMEditType editType;

@end
