//
//  DBHelper.h
//  ios_cloudlib_app
//
//  Created by apple on 16-9-21.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
@interface DBHelper:NSObject

@property(nonatomic,strong) NSManagedObjectContext *managedObjectContxt;

@property(nonatomic,strong) NSManagedObjectModel *managedObjectModel;

@property(nonatomic,strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (id) saveModel:(NSString *)modelName;

- (void) deleteModel:(NSString *)modelName columnName:(NSString *)columnName columnValue:(id) columnValue valueType:(NSString *)format;

- (void) clearModels;

- (id) updateModel:(NSString *)modelName columnName:(NSString *)columnName columnValue:(id) columnValue valueType:(NSString *)format;

- (id) findOne:(NSString *)modelName columnName:(NSString *)columnName columnValue:(id)columnValue valueType:(NSString *)format;

- (void) commitData;

- (NSArray *) query:(NSString *)modelName coreDataSQL:(NSString *)coreDataSQL;
@end