//
//  UserController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-14.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "UserController.h"
#import "SwitchSchoolController.h"
#import "StringHelper.h"
#import "SynchronousHttpData.h"
#import "ComonDefine.h"
#import "HttpHelper.h"
#import "UserBean.h"
#import "JsonUtil.h"
#import "IndexController.h"
#import "UserDelegate.h"
#import "FactoryHelper.h"
#import "LoginInfoBean.h"

@interface UserController ()
@property(nonatomic,strong) SwitchSchoolController *switchSchoolController;

@property(nonatomic,strong) NSDictionary *dictData;

@property(nonatomic,strong) IndexController* indexController;


/***action**/
/**选择学校action**/
- (IBAction)schoolBtView:(id)sender;

/**学校发生改变时候瑶执行的方法**/
- (IBAction)schoolChange:(id)sender;

/**账号发生改变时候瑶执行的方法**/
- (IBAction)userNameChange:(id)sender;

/**密码发生改变时候瑶执行的方法**/
- (IBAction)passwordChange:(id)sender;
/***登入**/
- (IBAction)loginAction:(id)sender;

/***view****/
/***选择学校view***/
@property (weak, nonatomic) IBOutlet UITextField *schoolView;
/****账号view****/
@property (weak, nonatomic) IBOutlet UITextField *userNameView;
/***密码view***/
@property (weak, nonatomic) IBOutlet UITextField *passwordView;

/**loginView**/
@property (weak, nonatomic) IBOutlet UIButton *loginView;

/**圈圈**/
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *gaiView;
/**左边*/
@property (weak, nonatomic) IBOutlet UILabel *leftLabelView;
/**右边**/
@property (weak, nonatomic) IBOutlet UILabel *rightLabelView;
/**提示信息**/
@property (weak, nonatomic) IBOutlet UILabel *messageLabelView;





@end

@implementation UserController

- (void)viewDidLoad {
    [super viewDidLoad];
    //圈圈隐藏
    self.gaiView.hidesWhenStopped = YES;
    self.gaiView.hidden = true;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**返回的时候调用的方法***/
- (void)viewWillAppear:(BOOL)animated{
    [self receiveNSNotificationCenter:self selector:@selector(doBackAction:)  name:@"switchSchoolController" object:nil];
}

/**设置登入按钮是否开启**/
-(void) setEnableLoginBt {
    //获取页面的值，并且附值
    NSString* schoolName = self.schoolView.text;
    NSString* nameValue = self.userNameView.text;
    NSString* passwordValue = self.passwordView.text;
    
    //判断值是不是空的  不为空的就将按钮开启
    if (![StringHelper isBlankString:schoolName] && ![StringHelper isBlankString:nameValue] && ![StringHelper isBlankString:passwordValue]) {
        //开启按钮
        self.loginView.enabled = YES;
    }else {
        //禁用按钮
        self.loginView.enabled = NO;
    }
    
}


/***点击登入的时候显示登入*/
-(void) openLoginMessage{
    self.gaiView.hidden = false;
    [self.gaiView startAnimating];
    self.leftLabelView.hidden = false;
    self.rightLabelView.hidden = false;
}
/***关闭登入提示*/
-(void) closeLoginMessage{
    self.gaiView.hidden = true;
    [self.gaiView stopAnimating];
    self.leftLabelView.hidden = true;
    self.rightLabelView.hidden = true;
}
/***开启错误提示**/
-(void) openErrorMessage{
    self.messageLabelView.hidden = false;
    
}
/**关闭错误提示**/
-(void) closeErrorMessage{
    self.messageLabelView.hidden = true;
}



-(void)doBackAction:(NSNotification*)sender{
    
    NSDictionary *dic = sender.userInfo;
    self.dictData = dic;
    
    //设置学校的名字
    self.schoolView.text =[dic valueForKey:@"schoolName"];
    
}

-(void)dealloc
{
    //移除监听对象自己
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


/**学校action***/

- (IBAction)schoolBtView:(id)sender {
    //跳转到选择学校那个页面
    //xib 跳转
    self.switchSchoolController=[[SwitchSchoolController alloc]initWithNibName:@"SwitchSchoolController" bundle:nil];
    [self presentViewController:self.switchSchoolController animated:YES completion:^{
        
    }];
}

- (IBAction)schoolChange:(id)sender {
    [self setEnableLoginBt];
}

- (IBAction)userNameChange:(id)sender {
    [self setEnableLoginBt];
}

- (IBAction)passwordChange:(id)sender {
    [self setEnableLoginBt];
}

- (IBAction)loginAction:(id)sender {
    //获取页面上的值
    NSString* schoolName = [self.schoolView.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString* nameValue = self.userNameView.text;
    NSString* passwordValue = self.passwordView.text;
    
    //拼接数据
    SynchronousHttpData *synchronousHttpData = [[SynchronousHttpData alloc] init];
    NSString *param = [[[[[@"schoolName=" stringByAppendingString:schoolName] stringByAppendingString:@"&barcode="] stringByAppendingString:nameValue] stringByAppendingString:@"&password="] stringByAppendingString:passwordValue];
    NSString *url = [D_HTTP_URL stringByAppendingString:D_HTTP_METHOD_LOGINFORSTU];
    
    synchronousHttpData.url = url;
    synchronousHttpData.param = param;
    
    //等待登入的提示
    [self openLoginMessage];
    
    [HttpHelper postBySynchronousHttpData:synchronousHttpData];
    
    //如果错误就报网络链接错误
    if(synchronousHttpData.error != nil){
        // 先关闭提示
        [self closeLoginMessage];
        
        [self netISOpen:synchronousHttpData.error];
        
        return;
        
    }
    NSString *dataString = [[ NSString alloc] initWithData:synchronousHttpData.data encoding:NSUTF8StringEncoding];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:synchronousHttpData.data options:kNilOptions error:nil];
    
    //判断返回的东西
    if ([StringHelper isBlankString:dataString] ) {
        //如果是nil  说明用户名密码错误
        //1.2 开启错误提示
        [self openErrorMessage];
        //1.3几秒后关闭
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(closeErrorMessage) userInfo:nil repeats:NO];
    }else{
        
        UserBean *userBean=[JsonUtil paresJsonToUser:dataString];
        NSLog(@"%@",userBean);
        
        //如果正确就进行跳转
        UserDelegate *userDelegate=[FactoryHelper initFactoryHelperAndgetDBInstance:@"UserDelegate"];
        [userDelegate clearUsers:@"User"];
        
        [userDelegate saveUser:userBean.userId userName:userBean.userName barcode:userBean.barcode password:userBean.password schoolId:userBean.schoolId type:userBean.type loginJudge:userBean.loginJudge message:userBean.message teacherId:userBean.teacherId];
        [LoginInfoBean setLoginInfo:dict];
        
        //xib跳转
        self.indexController=[[IndexController alloc]initWithNibName:@"IndexController" bundle:nil];
        [self presentViewController:self.indexController animated:YES completion:^{
            
        }];
        
        
    }
    
}
@end