//
//  YMListTableViewController.m
//  YMStoryboard
//
//  Created by Yiming on 14/11/30.
//  Copyright (c) 2014年 Henizaiyiqi. All rights reserved.
//

#import "YMListTableViewController.h"
#import "YMAddOrModifyViewController.h"

@interface YMListTableViewController ()
{
    NSMutableArray *personsArray;
    NSIndexPath *selectedIndexPath;
}
@end

@implementation YMListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    personsArray = [[NSMutableArray alloc] initWithObjects:@"Tom",@"Jerry",@"Sam",@"Mike",@"Lucy", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    UINavigationController *navController = segue.destinationViewController;
    YMAddOrModifyViewController *controller = navController.viewControllers[0];
    if([sender isKindOfClass:[UIBarButtonItem class]]){
        controller.editType = YMEditTypeAdd;
    }else if([sender isKindOfClass:[UITableViewCell class]]){
        UITableViewCell *cell = (UITableViewCell *)sender;
        selectedIndexPath = [self.tableView indexPathForCell:cell];
        
        controller.editType = YMEditTypeModify;
        controller.textStr =  cell.textLabel.text;
    }
}

- (IBAction) unwindToList:(UIStoryboardSegue *)segue
{
    YMAddOrModifyViewController *addOrModifyController = segue.sourceViewController;
    
    if(addOrModifyController.textStr.length == 0)
        return;
    
    if (addOrModifyController.editType == YMEditTypeAdd) {//添加
        [personsArray addObject:addOrModifyController.textStr];
    }else if(addOrModifyController.editType == YMEditTypeModify){//修改
        [personsArray replaceObjectAtIndex:selectedIndexPath.row withObject:addOrModifyController.textStr];
    }
    
    [self.tableView reloadData];//刷新数据
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return personsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    NSString *cellIdentityStr = @"GreenListCell";
    if(indexPath.row % 2 == 0){
        cellIdentityStr = @"RedListCell";
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentityStr forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",personsArray[indexPath.row]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
