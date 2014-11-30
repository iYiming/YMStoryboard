//
//  YMAddOrModifyViewController.m
//  YMStoryboard
//
//  Created by Yiming on 14/11/30.
//  Copyright (c) 2014年 Henizaiyiqi. All rights reserved.
//

#import "YMAddOrModifyViewController.h"

@interface YMAddOrModifyViewController ()
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveItem;

@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation YMAddOrModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    if (self.editType == YMEditTypeModify) {
        self.textField.text = self.textStr;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (sender != self.saveItem)
        return;
    
    if(self.textField.text.length > 0){
        self.textStr = self.textField.text;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
