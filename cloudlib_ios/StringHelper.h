//
//  StringHelper.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-20.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface StringHelper : NSObject

+(bool) isNotBlank:(NSString *)strSource;
+(NSString *)substringFromIndexToIndex:
(NSString *)strSource
                                  from:(NSInteger)fromIndex to:(NSInteger) toIndex;
+(NSArray *)splitWithMark:(NSString *)strSource mark:(NSString *)mark;

/***判断字符串是不是null或者是空串**/
+(BOOL) isBlankString:(NSString *)string;
@end