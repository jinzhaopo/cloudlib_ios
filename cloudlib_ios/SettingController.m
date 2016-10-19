//
//  SettingController.m
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-19.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "SettingController.h"

@interface SettingController ()

/**view***/
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/**action***/
- (IBAction)exitAction:(id)sender;

@end

@implementation SettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
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

- (IBAction)exitAction:(id)sender {
}
@end
