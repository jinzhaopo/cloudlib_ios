//
//  SynchronousHttpData.h
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-12.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SynchronousHttpData : NSObject

@property (nonatomic , strong) NSString* url;

@property (nonatomic, strong) NSString* param;

//同步时候返回的参数
@property (nonatomic, strong) NSData *  data;

@property (nonatomic, strong) NSURLResponse *  response;

@property (nonatomic, strong) NSError *  error;
@end
