//
//  UserInfoController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "UserInfoController.h"

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/***组件**/
/**返回***/
- (IBAction)backAction:(id)sender {
    [self goBack4PresentViewController];
}
@end
