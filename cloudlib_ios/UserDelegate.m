//
//  UserDelegate.m
//  ios_cloudlib_app 
//
//  Created by apple on 16-9-21.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "UserDelegate.h"
#import "User.h"
@implementation UserDelegate

//根据用户名查找用户
- (User *)findByUserName:(NSString *) userName{
    User *user=[self findOne:@"User" columnName:@"userName" columnValue:userName valueType:@"%@"];
    return user;
}

//设置用户对象属性
- (void)setUserProperties:(User *)user userId:(NSNumber *)userId userName:(NSString *) userName
                  barcode:(NSString *)barcode password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge message:(NSString *)message teacherId:(NSNumber *)teacherId{
    user.userId=userId;
    user.userName=userName;
    user.barcode=barcode;
    user.password=password;
    user.schoolId=schoolId;
    user.type=type;
    user.loginJudge=loginJudge;
    user.message=message;
    user.teacherId=teacherId;}

//保存用户
- (User *) saveUser:(NSNumber *)userId userName:(NSString *) userName
            barcode:(NSString *)barcode password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge message:(NSString *)message teacherId:(NSNumber *)teacherId{
    User *user=[self saveModel:@"User"];
    [self setUserProperties:user userId:userId userName:userName barcode:barcode password:password schoolId:schoolId type:type loginJudge:loginJudge message:message teacherId:teacherId];
    [self commitData];
    return user;
}
//更新用户
- (User *)updateUser:(NSString *)columnName columnValue:(id)columnValue
           valueType:(NSString *)valueType userId:(NSNumber *)userId userName:(NSString *) userName
             barcode:(NSString *)barcode password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge message:(NSString *)message teacherId:(NSNumber *)teacherId{
    User *user=[self updateModel:@"User" columnName:columnName columnValue:columnValue valueType:valueType];
    [self setUserProperties:user userId:userId userName:userName barcode:barcode password:password schoolId:schoolId type:type loginJudge:loginJudge message:message teacherId:teacherId];
    [self commitData];
    return user;
}

//删除用户
- (void) deleteUser:(NSString *)columnName columnValue:(id)columnValue
          valueType:(NSString *)valueType{
    [self deleteModel:@"User" columnName:columnName
                     columnValue:columnValue valueType:valueType];
}

//清除所有用户
- (void) clearUsers:(NSString *)modelName{
    [self clearModels:modelName];
}

//判断用户是否已经登录
- (bool) isLoginJudge:(NSNumber *) loginJudge{
    return [loginJudge isEqual:@1];
}

//查询所有用户
- (NSArray *) queryAllUsers:(NSString *)modelName coreSQL:(NSString *)coreSQL{
    NSArray *array=[self query:modelName coreDataSQL:coreSQL];
    return array;
}

@end