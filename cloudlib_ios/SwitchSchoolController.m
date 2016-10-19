//
//  SwitchSchoolController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-14.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "SwitchSchoolController.h"
#import "StringHelper.h"
#import "HttpData.h"
#import "HttpHelper.h"
#import "ComonDefine.h"


@interface SwitchSchoolController ()

@property (strong, nonatomic) NSArray *dataList;


/***表格****/
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SwitchSchoolController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) search:(UISearchBar *) searchBar{
    NSString *searchText = searchBar.text;
    //调用http去获取数据 异步太慢  so搞成同步
    if(![StringHelper isBlankString:searchText]){
        SynchronousHttpData *httpData = [[SynchronousHttpData alloc]init];
        
        httpData.url = [D_HTTP_URL stringByAppendingString:D_HTTP_METHOD_GETLISTBYSCHOOLNAME];
        NSString *param = [@"schoolName=" stringByAppendingString:searchText];
        httpData.param = param;
        
        //开启loading
        [self loading];
        
        httpData = [HttpHelper postBySynchronousHttpData:httpData];
        
        //关闭loading
        [self cleanLoading];
        //获取数据后进行判断
        if(httpData.error == nil){
            
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:httpData.data options:kNilOptions error:nil];
            
            
            NSMutableArray *dataArray = [[NSMutableArray alloc]init];
            
            for(NSDictionary *dic in dict){
                [dataArray addObject:dic];
                
            }
            
            self.dataList = dataArray;

            [self refreshView:YES];
            
        }else{
         
            [self netISOpen:httpData.error];
            NSLog(@"网络链接错误");
        }
    }
    
}

#pragma UISearch
//点击键盘上的search按钮时调用
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self search:searchBar];
    
    
}
//输入文本实时更新时调用
- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    [self search:searchBar];
}

//cancel按钮点击时调用
- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [self search:searchBar];
    [searchBar resignFirstResponder];
    
}


//点击搜索框时调用
- (void) searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    
}
#pragma mark -
#pragma mark Table View Data Source Methods

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
/***行数**/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataList count];
}

/****设置单元格***/
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *TableSampleIdentifier = @"CellIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableSampleIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:TableSampleIdentifier];
    }
    
    NSUInteger row = [indexPath row];
    cell.textLabel.text = [[self.dataList objectAtIndex:row] valueForKey:@"schoolName"];
    
    
    cell.detailTextLabel.text = [[self.dataList objectAtIndex:row] valueForKey:@"schoolCode"];
    cell.detailTextLabel.hidden = true;
    return cell;
}

/***选中后的操作***/
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *schoolName = [[self.dataList objectAtIndex:[indexPath row]] valueForKey:@"schoolName"];
    
    NSString *schoolCode = [[self.dataList objectAtIndex:[indexPath row]] valueForKey:@"schoolCode"];
//    UIAlertView * alter = [[UIAlertView alloc] initWithTitle:@"选中的行信息" message:schoolCode delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
    [dic setValue:schoolName forKey:@"schoolName"];
    [dic setValue:schoolCode forKey:@"schoolCode"];
    
    //开启通知dic
    [self sendNSNotificationCenter:@"switchSchoolController" and:self and:dic];
    //返回
    [self goBack4PresentViewController];
}

/***刷新***/
-(void)refreshView:(BOOL)flag{
    if (flag == YES){
        [self.tableView reloadData];
    }
}





@end
