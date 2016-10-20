//
//  UserInfoController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "UserInfoController.h"
#import "LoginInfoBean.h"
#import "User.h"


@interface UserInfoController ()

/***action**/
- (IBAction)backAction:(id)sender;

@end

@implementation UserInfoController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
/**
 *  1.告诉tableview一共有多少组
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}
/**
 *  2.第section组有多少行
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
/**
 *  3.告知系统每一行显示什么内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    indexPath.section; // 第几组
    //    indexPath.row; // 第几行
    // 1.创建cell
    
    
    //= [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
      UITableViewCell *cell  = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"] ;
  
    
    // 2.设置数据
    // cell.textLabel.text = @"汽车";
    // 判断是第几组的第几行
    NSDictionary *userDic = [LoginInfoBean getLoginInfo];
    
    
    if (0 == indexPath.row){ // 第0组第0行
        cell.textLabel.text = @"用户名";
        cell.detailTextLabel.text = [userDic valueForKey:@"barcode"];
    }else if (1 == indexPath.row){ // 第0组第1行
        cell.textLabel.text = @"姓名";
        cell.detailTextLabel.text = [userDic valueForKey:@"userName"];
    }else if(2 == indexPath.row){
        cell.textLabel.text = @"学校";
        cell.detailTextLabel.text = [userDic valueForKey:@"schoolName"];
    }else if(3 == indexPath.row){
        cell.textLabel.text = @"类型";
        NSString *type = [userDic valueForKey:@"type"];
        int typeInt = [type intValue];
        if(typeInt == 1){
            cell.detailTextLabel.text = @"学生";
        }else{
            cell.detailTextLabel.text = @"管理员";
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
    }else{
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



/***组件**/
/**返回***/
- (IBAction)backAction:(id)sender {
    [self goBack4PresentViewController];
}
@end
