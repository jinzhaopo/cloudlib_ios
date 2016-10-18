//
//  AlertDelegate.h
//  cloudlib_ios
//
//  Created by apple on 16-10-17.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface AppUpdateDelegate:NSObject <UIAlertViewDelegate>

- (UIAlertView *)alertUpdateApp;

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex;

@end