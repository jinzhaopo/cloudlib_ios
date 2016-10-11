//
//  HttpHelper.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-19.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HttpData.h"
@interface HttpHelper : NSObject
+(NSMutableURLRequest *) initRequestWithUrl:(NSString *)urlString;

+ (void) sendHttpRequest:(NSString *)params
            timeInterval:(double)timeoutInterval httpMethod:(NSString *)httpMethod encoding:(NSInteger)encoding;

+(bool) isExistCookie:(NSString *)key;

/**
 *对请求路径的说明
 *
 *http://120.25.226.186:32812/login?username=520it&pwd=520t=J
 *
 *协议头+主机地址+接口名称+？+参数1&参数2&参数3
 
 *协议头(http://)+主机地址(120.25.226.186:32812)+接口名称(login)+？+参数1(username=520it)&参数2(pwd=520)&参数3(type=JSON)
 
 *GET请求，直接把请求参数跟在URL的后面以？隔开，多个参数之间以&符号拼接

 */
+(void) get:(HttpData*) httpData ;

/**对请求路径的说明
 *http://120.25.226.186:32812/login
 
 *协议头+主机地址+接口名称
 
 *协议头(http://)+主机地址(120.25.226.186:32812)+接口名称(login)
 
 *POST请求需要修改请求方法为POST，并把参数转换为二进制数据设置为请求体*/
+(void) post:(HttpData*) httpData ;


@end
