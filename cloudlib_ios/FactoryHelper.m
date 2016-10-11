//
//  FactoryDelegate.m
//  ios_cloudlib_app
//
//  Created by apple on 16-9-21.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "FactoryHelper.h"
#import "ComonDefine.h"
@implementation FactoryHelper

+ (id) initFactoryHelperAndgetDBInstance{
    return [[[FactoryHelper alloc] init] getDBInstance];
}

- (id) getDBInstance{
    if(self->_instance==nil){
        self->_instance=[[DBHelper alloc] init];
        self->_instance.managedObjectContxt=[FactoryHelper initManagedContext];
        self->_instance.managedObjectModel=[FactoryHelper initManagedObjectModel];
        self->_instance.persistentStoreCoordinator=[FactoryHelper persistentStoreCoordinator:self->_instance.managedObjectModel];
        [self->_instance.managedObjectContxt setPersistentStoreCoordinator:self->_instance.persistentStoreCoordinator];
    }
    return self->_instance;
}

+(NSManagedObjectContext *)initManagedContext{
    NSManagedObjectContext *managerContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    return managerContext;
}

+(NSManagedObjectModel *)initManagedObjectModel{
    NSURL *modelURL=[[NSBundle mainBundle] URLForResource:D_SQLLITE_MODEL_FILE_NAME
                                            withExtension:D_SQLLITE_MODEL_FILE_SUFFIX];
    NSManagedObjectModel *model=[[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return model;
}

+(NSPersistentStoreCoordinator *)persistentStoreCoordinator:(NSManagedObjectModel *) model{
    NSPersistentStoreCoordinator * coordinator=[[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    NSError *error;
    NSURL *storeURL=[[FactoryHelper initSqlitePath] URLByAppendingPathComponent:@"cloudlib.sqlite"];
    if(![coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]){
        NSLog(@"sqllite init error:%@",[error userInfo]);
    }
    return  coordinator;
}

+(NSURL *)initSqlitePath{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}
@end