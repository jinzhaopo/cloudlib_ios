//
//  AdminController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-9-29.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "AdminController.h"
#import "StringHelper.h"
#import "HttpHelper.h"
#import "HttpData.h"
#import "ComonDefine.h"
#import "IndexController.h"
#import "UserDelegate.h"
#import "FactoryHelper.h"
#import "LoginInfoBean.h"
#import "JsonUtil.h"
#import "SynchronousHttpData.h"
#import "IndexController.h"

@interface AdminController ()
@property (nonatomic,strong) IndexController* indexController;

@property (nonatomic , strong) NSString* nameValue;

/**密码的值***/
@property (nonatomic , strong) NSString* passwordValue;


//-------组件------------

//以后视图都加view
/**账号输入框**/
@property (weak, nonatomic) IBOutlet UITextField *nameView;

/***密码输入框*/
@property (weak, nonatomic) IBOutlet UITextField *passwordView;

/**登入按钮**/
@property (weak, nonatomic) IBOutlet UIButton *loginView;
/**圈圈**/
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *gaiView;
/**左边*/
@property (weak, nonatomic) IBOutlet UILabel *leftLabelView;
/**右边**/
@property (weak, nonatomic) IBOutlet UILabel *rightLabelView;
/**提示信息**/
@property (weak, nonatomic) IBOutlet UILabel *messageLabelView;

//以后动作都加action
/**返回按钮**/
- (IBAction)goBack;

/**登入**/
- (IBAction)login;

/**账号变化**/
- (IBAction)nameChange;

/**密码变化**/
- (IBAction)passwordChange;




@end

@implementation AdminController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //圈圈隐藏
    self.gaiView.hidesWhenStopped = YES;
    self.gaiView.hidden = true;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**设置登入按钮是否开启**/
-(void) setEnableLoginBt {
    //获取页面的值，并且附值
    self.nameValue = self.nameView.text;
    self.passwordValue = self.passwordView.text;
    
    //判断值是不是空的  不为空的就将按钮开启
    if (![StringHelper isBlankString:self.nameValue] && ![StringHelper isBlankString:self.passwordValue]) {
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

//----------组件----------

- (IBAction)goBack {
    [self goBack4PresentViewController];
}

- (IBAction)login {
    //TODO 登入
    SynchronousHttpData *synchronousHttpData = [[SynchronousHttpData alloc] init];
    NSString *param = [[[@"userName=" stringByAppendingString:self.nameValue] stringByAppendingString:@"&password="] stringByAppendingString:self.passwordValue];
    NSString *url = [D_HTTP_URL stringByAppendingString:D_HTTP_METHOD_LOGINFORTEACHER];
    
    synchronousHttpData.url = url;
    synchronousHttpData.param = param;
    
    
    
    [HttpHelper getBySynchronousHttpData:synchronousHttpData];
    
    //等待登入的提示
    [self openLoginMessage];
    
    NSString *dataString = [[ NSString alloc] initWithData:synchronousHttpData.data encoding:NSUTF8StringEncoding];
    NSLog(@"%@",dataString);
    if([StringHelper isBlankString:dataString]){
        //判断返回的东西
        //如果是nil  说明用户名密码错误
        //1.1 先关闭提示
        [self closeLoginMessage];
        //1.2 开启错误提示
        [self openErrorMessage];
        //1.3几秒后关闭
        [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(closeErrorMessage) userInfo:nil repeats:NO];
    }else{
        // UserBean *userBean=[JsonUtil paresJsonToUser:dataString];
        
        //xib跳转
        self.indexController=[[IndexController alloc]initWithNibName:@"IndexController" bundle:nil];
        [self presentViewController:self.indexController animated:YES completion:^{
            
        }];
        
        
    }
    
    
    
    
}





- (IBAction)nameChange {
    [self setEnableLoginBt];
}

- (IBAction)passwordChange {
    [self setEnableLoginBt];
    
}

/***重写方法***/
/**
 *被网络调用的方法  每个继承的controller必须重写这个方法
 *
 **/
-(void) httpAction:(int) what and: (NSData *)  data and: (NSURLResponse * )  response and: (NSError *)  error{
    
    //先要判断网络是否链接
    [self netISOpen:error];
    NSString *dataString=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    switch (what) {
        case 1:
            
            break;
            
        default:
            break;
    }
    
}


@end
