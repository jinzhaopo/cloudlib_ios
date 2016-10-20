//
//  SettingController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-19.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "SettingController.h"
#import "AppDelegate.h"
#import "UserInfoController.h"
@interface SettingController ()


/***view***/
@property (weak, nonatomic) IBOutlet UITableView *uiTable;

/**action***/
- (IBAction)backAction:(id)sender;



@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}
#pragma mark - UITableViewDataSource
/**
 *  1.告诉tableview一共有多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}
/**
 *  2.第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (0 == section) {
        // 第0组有多少行
        return 2;
    }else
    {
        // 第1组有多少行
        return 2;
    }
}
/**
 *  3.告知系统每一行显示什么内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    indexPath.section; // 第几组
    //    indexPath.row; // 第几行
    // 1.创建cell
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    // 2.设置数据
    // cell.textLabel.text = @"汽车";
    // 判断是第几组的第几行
    if (0 == indexPath.section) { // 第0组
        
        if (0 == indexPath.row){ // 第0组第0行
            cell.textLabel.text = @"个人信息";
        }else if (1 == indexPath.row){ // 第0组第1行
            
            cell.textLabel.text = @"xxxx";
        }
        
    }else if (1 == indexPath.section) // 第1组
    {
        if (0 == indexPath.row) { // 第0组第0行
            cell.textLabel.text = @"关于云图";
        }else if (1 == indexPath.row) // 第0组第1行
        {
            cell.textLabel.text = @"退出";
        }
    }
    
    // 3.返回要显示的控件
    return cell;
    
}
/**
 *  第section组头部显示什么标题
 *
 */
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    if (0 == section) {
        return @" ";
    }else
    {
        return @" ";
    }
}
/**
 *  第section组底部显示什么标题
 *
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (0 == section) {
        return @"  ";
    }else{
        return @" ";
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/***选中后的操作***/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    long row = indexPath.row;
    long section =indexPath.section;
    if (section == 1 && row == 1) {
        //退出
        UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"nil" message:@"确定要退出?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        
        [alert show];
    }else if(section==0 && row == 0){
        //个人信息
        //xib 跳转
        UserInfoController *userInfoController=[[UserInfoController alloc]initWithNibName:@"UserInfoController" bundle:nil];
        [self presentViewController:userInfoController animated:YES completion:^{
            
        }];
        
    }
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if(buttonIndex == 1){
        //执行退出的代码
    }
}


- (IBAction)backAction:(id)sender {
    [self goBack4PresentViewController];
}


@end
