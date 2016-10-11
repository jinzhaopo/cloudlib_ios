//
//  HttpData.h
//  cloudlib_ios
//
//  Created by jinzhaopo on 16-10-8.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseController.h"

@interface HttpData : NSObject

@property (nonatomic , strong) NSString* url;

@property (nonatomic, strong) NSString* param;

/***用户回调时候的标示***/
@property (nonatomic) int what;

@property (nonatomic) BaseController* baseController;

@end
