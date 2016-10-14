//
//  cloudlib_iosTests.m
//  cloudlib_iosTests
//
//  Created by jinzhaopo on 16-9-28.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "User.h"
#import "UserDelegate.h"
#import "FactoryHelper.h"
#import "DBHelper.h"

@interface cloudlib_iosTests : XCTestCase

@end

@implementation cloudlib_iosTests

- (void)setUp {
    [super setUp];
    
    //NSLog(@"aaaaaaaaaaaaa");
    UserDelegate *userDelegate=[FactoryHelper initFactoryHelperAndgetDBInstance:@"UserDelegate"];
    
    //新增对象
    //User *user=[userDelegate saveModel:@"User"];
    //user.userName=@"zs";
    //user.password=@"123";
    //[userDelegate commitData];
    //删除对象
    //[userDelegate deleteModel:@"User" columnName:@"userName" columnValue:@"'zs'" valueType:@"%@"];

    //更新对象
    //user=[userDelegate updateModel:@"User" columnName:@"userName"columnValue:@"'zs'" valueType:@"%@"];
    //user.userName=@"lisi";
    //user.password=@"789";
    //[userDelegate commitData];
    
    //查询对象
    //NSArray *array=[userDelegate query:@"User" coreDataSQL:@"1=1"];
    //for(User *u in array){
        //NSLog(@"%@",u.userName);
    //}
    
   [userDelegate clearUsers:@"User"];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
