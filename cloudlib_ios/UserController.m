//
//  UserController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-14.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "UserController.h"
#import "SwitchSchoolController.h"

@interface UserController ()
@property(nonatomic,strong) SwitchSchoolController *switchSchoolController;

/***action**/
/**选择学校action**/
- (IBAction)schoolBtView:(id)sender;



/***view****/
/***选择学校view***/
@property (weak, nonatomic) IBOutlet UITextField *schoolView;

@end

@implementation UserController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**学校action***/

- (IBAction)schoolBtView:(id)sender {
    //跳转到选择学校那个页面
    //xib 跳转
    self.switchSchoolController=[[SwitchSchoolController alloc]initWithNibName:@"SwitchSchoolController" bundle:nil];
    [self presentViewController:self.switchSchoolController animated:YES completion:^{
        
    }];
}
@end
