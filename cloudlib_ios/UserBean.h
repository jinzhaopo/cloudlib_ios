//
//  UserBean.h
//  cloudlib_ios
//
//  Created by apple on 16-10-12.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserBean : NSObject

@property (nonatomic, retain) NSNumber * ids;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * barcode;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSNumber * schoolId;
@property (nonatomic, retain) NSNumber * type;
@property (nonatomic, retain) NSNumber * loginJudge;
@property (nonatomic, retain) NSString * message;
@property (nonatomic, retain) NSNumber * teacherId;

@end