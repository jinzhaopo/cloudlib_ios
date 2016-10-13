//
//  FactoryDelegate.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-21.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "DBHelper.h"

static DBHelper *instanceBean;

@interface FactoryHelper:NSObject

@property(nonatomic,strong) DBHelper *instance;

+ (id) initFactoryHelperAndgetDBInstance:(NSString *)delegateName;
@end