//
//  UserDelegate.h
//  ios_cloudlib_app
//
//  Created  by apple on 16-9-21.
//  Copyr igh(c) 2016年 yundao. All rights reserved.
//

#import "UserDelegate.h"
#import "DBHelper.h"
#import "User.h"
@interface UserDelegate:DBHelper

- (User *)findByUserName:(NSString *) userName;

- (User *) saveUser:(NSNumber *)userId userName:(NSString *) userName
            barcode:(NSString *)barcode password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge message:(NSString *)message teacherId:(NSNumber *)teacherId;

- (User *)updateUser:(NSString *)columnName columnValue:(id)columnValue
valueType:(NSString *)valueType userId:(NSNumber *)userId userName:(NSString *) userName
             barcode:(NSString *)barcode password:(NSString *)password schoolId:(NSNumber *)schoolId type:(NSNumber *)type loginJudge:(NSNumber *)loginJudge message:(NSString *)message teacherId:(NSNumber *)teacherId;

- (void) deleteUser:(NSString *)columnName columnValue:(id)columnValue
          valueType:(NSString *)valueType;

- (bool) isLoginJudge:(NSNumber *) loginJudge;
@end