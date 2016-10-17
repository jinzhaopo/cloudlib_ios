//
//  HttpHelper.m
//  ios_cloudlib_app
//
//  Created by apple on 16-9-19.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "ComonDefine.h"
#import "HttpHelper.h"
#import "BaseController.h"
@interface HttpHelper()


@end
@implementation HttpHelper
+(NSMutableURLRequest *) initRequestWithUrl:(NSString *)urlString{
    NSURL *url=[NSURL URLWithString:urlString];
    NSMutableURLRequest *request=[NSMutableURLRequest requestWithURL:url];
    return request;
}

+ (void) sendHttpRequest:(NSString *)params
            timeInterval:(double)timeoutInterval httpMethod:(NSString *)httpMethod encoding:(NSInteger)encoding {
    NSString *urlPath=D_HTTP_URL;
    if([httpMethod isEqualToString:@"GET"] && params!=nil && ![params isEqualToString:@""]){
        urlPath=[urlPath stringByAppendingString:@"?"];
        urlPath=[urlPath stringByAppendingString:params];
    }
    
    NSMutableURLRequest *request=[HttpHelper initRequestWithUrl:urlPath];
    
    if(urlPath.length==D_HTTP_URL.length)
        request.HTTPBody=[params dataUsingEncoding:encoding];
    
    request.timeoutInterval=timeoutInterval;
    request.HTTPMethod=httpMethod;
    
    NSURLSession *session=[NSURLSession sharedSession];
    NSURLSessionDataTask *task=[session dataTaskWithRequest:request
                                          completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                              if(data!=nil){
                                                  NSString *dataString=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                                                  NSLog(@"%@",dataString);
                                              }
                                          }];
    [task resume];
}

+(void) saveCookie:(NSString *)key cookieValue:(NSString *)value{
    NSHTTPCookieStorage *cookieStorage=[NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSMutableDictionary *dic=[[NSMutableDictionary alloc] init];
    [dic setObject:value forKey:key];
    [dic setValue:[NSDate dateWithTimeIntervalSinceNow:D_COOKIE_AGE] forKey:key];
    NSHTTPCookie *httpCookie=[NSHTTPCookie cookieWithProperties:dic];
    [cookieStorage setCookie:httpCookie];
}

+(NSHTTPCookie *) getCookieForKey:(NSString *)key{
    NSHTTPCookieStorage *cookieStorage=[NSHTTPCookieStorage sharedHTTPCookieStorage];
    NSArray * cookieArray=[cookieStorage cookies];
    for(NSHTTPCookie * cookie in cookieArray){
        if([[cookie name] isEqualToString:key]){
            return cookie;
        }
    }
    return nil;
}

+(bool) isExistCookie:(NSString *)key{
    return [HttpHelper getCookieForKey:key]!=nil;
}


/**
 *对请求路径的说明
 *
 *http://120.25.226.186:32812/login?username=520it&pwd=520t=J
 *
 *协议头+主机地址+接口名称+？+参数1&参数2&参数3
 
 *协议头(http://)+主机地址(120.25.226.186:32812)+接口名称(login)+？+参数1(username=520it)&参数2(pwd=520)&参数3(type=JSON)
 
 *GET请求，直接把请求参数跟在URL的后面以？隔开，多个参数之间以&符号拼接
 
 */
+(void) get: (HttpData*) httpData {
    //1.确定请求路径
    NSURL *_url = [NSURL URLWithString:[[httpData.url stringByAppendingString:@"?"]stringByAppendingString:httpData.param ] ];
    
    
    //2.创建请求对象
    //请求对象内部默认已经包含了请求头和请求方法（GET）
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    
    //3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.根据会话对象创建一个Task(发送请求）
    /*
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
     */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        
        //回调  具体的实现在不同的controller中
        BaseController* baseController = httpData.baseController;
        [baseController httpAction:httpData.what and:data and:response and:error];

        //if (error == nil) {
            //6.解析服务器返回的数据
            //说明：（此处返回的数据是JSON格式的，因此使用NSJSONSerialization进行反序列化处理）
           // NSDictionary *_dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
           // NSString *dataString=[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            //httpData.data = dataString;
        //}
    }];
    
    //5.执行任务
    [dataTask resume];
    
}

/**对请求路径的说明
 *http://120.25.226.186:32812/login
 
 *协议头+主机地址+接口名称
 
 *协议头(http://)+主机地址(120.25.226.186:32812)+接口名称(login)
 
 *POST请求需要修改请求方法为POST，并把参数转换为二进制数据设置为请求体*/
+(void) post: (HttpData*) httpData{
    
    //1.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //2.根据会话对象创建task
    NSURL *_url = [NSURL URLWithString:httpData.url];
    
    //3.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_url];
    
    //4.修改请求方法为POST
    request.HTTPMethod = @"POST";
    
    //5.设置请求体
    request.HTTPBody = [httpData.param dataUsingEncoding:NSUTF8StringEncoding];
    
    //6.根据会话对象创建一个Task(发送请求）
    /*
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
     */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        
        //8.解析数据
        //回调  具体的实现在不同的controller中
        BaseController* baseController = httpData.baseController;
        [baseController httpAction:httpData.what and:data and:response and:error];

        
    }];
    
    //7.执行任务
    [dataTask resume];
    
}

/***同步get请求**/
+(SynchronousHttpData*) getBySynchronousHttpData:(SynchronousHttpData*) synchronousHttpData {
    
    NSCondition* itlock = [[NSCondition alloc] init];//搞个事件来同步下
   
    //1.确定请求路径
    NSURL *_url = [NSURL URLWithString:[[synchronousHttpData.url stringByAppendingString:@"?"]stringByAppendingString:synchronousHttpData.param ] ];
    
    
    //2.创建请求对象
    //请求对象内部默认已经包含了请求头和请求方法（GET）
    NSURLRequest *request = [NSURLRequest requestWithURL:_url];
    
    //3.获得会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //4.根据会话对象创建一个Task(发送请求）
    /*
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
     */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        
        //回调
        synchronousHttpData.data = data;
        synchronousHttpData.response = response;
        synchronousHttpData.error = error;
        
        [itlock lock];
        
        [itlock signal];//设置事件,下面那个等待就可以收到事件返回了
        
        [itlock unlock];
    
    }];
    
    //5.执行任务
    [dataTask resume];
    
    [itlock lock];//启动执行任务之后就等待事件
    
    [itlock wait];
    
    [itlock unlock];

    return synchronousHttpData;
}


/***同步post请求**/
+(SynchronousHttpData*) postBySynchronousHttpData:(SynchronousHttpData*) synchronousHttpData {

    NSCondition* itlock = [[NSCondition alloc] init];//搞个事件来同步下
    
    //1.创建会话对象
    NSURLSession *session = [NSURLSession sharedSession];
    
    //2.根据会话对象创建task
    NSURL *_url = [NSURL URLWithString:synchronousHttpData.url];
    
    //3.创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_url];
    
    //4.修改请求方法为POST
    request.HTTPMethod = @"POST";
    
    //5.设置请求体
    request.HTTPBody = [synchronousHttpData.param dataUsingEncoding:NSUTF8StringEncoding];
    
    //6.根据会话对象创建一个Task(发送请求）
    /*
     第一个参数：请求对象
     第二个参数：completionHandler回调（请求完成【成功|失败】的回调）
     data：响应体信息（期望的数据）
     response：响应头信息，主要是对服务器端的描述
     error：错误信息，如果请求失败，则error有值
     */
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
        
        //回调
        synchronousHttpData.data = data;
        synchronousHttpData.response = response;
        synchronousHttpData.error = error;
        
        [itlock lock];
        
        [itlock signal];//设置事件,下面那个等待就可以收到事件返回了
        
        [itlock unlock];
        
    }];
    
    //5.执行任务
    [dataTask resume];
    
    [itlock lock];//启动执行任务之后就等待事件
    
    [itlock wait];
    
    [itlock unlock];
    
    return synchronousHttpData;
}

@end
