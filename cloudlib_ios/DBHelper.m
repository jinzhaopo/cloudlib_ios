//
//  DBHelper.m
//  ios_cloudlib_app
//
//  Created by apple on 16-9-21.
//  Copyright (c) 2016年 yundao. All rights reserved.
//

#import "DBHelper.h"
#import "ComonDefine.h"

@implementation DBHelper

- (id) saveModel:(NSString *)modelName{
      id entity=[NSEntityDescription insertNewObjectForEntityForName:modelName inManagedObjectContext:self.managedObjectContxt];
        return entity;
}

- (void) deleteModel:(NSString *)modelName columnName:(NSString *)columnName columnValue:(id) columnValue valueType:(NSString *)format{
    id entity=[self findOne:modelName columnName:columnName columnValue:columnValue valueType:format];
    [self.managedObjectContxt deleteObject:entity];
    [self commitData];
}

- (void) clearModels:(NSString *)modelName{
    [self.managedObjectContxt deletedObjects];
    //NSArray *array=[self query:modelName coreDataSQL:@"1=1"];
    //if([array count]){
      //  for(id entity in array){
        //    [self.managedObjectContxt deleteObject:entity];
        //}
        //[self commitData];
    //}
    [self commitData];
}

- (id) updateModel:(NSString *)modelName columnName:(NSString *)columnName columnValue:(id) columnValue valueType:(NSString *)format{
    id entity=[self findOne:modelName columnName:columnName columnValue:columnValue valueType:format];
    return entity;
}

- (void) commitData{
    NSError *error;
    if([self.managedObjectContxt save:&error])
        NSLog(@"保存成功");
    else
        NSLog(@"保存失败");
}

- (NSFetchRequest *)loadRequest:(NSString *)modelName{
    NSFetchRequest *request=[NSFetchRequest fetchRequestWithEntityName:modelName];
    return request;
}

- (NSArray *) excuteRequest:(NSFetchRequest *)request{
    NSError *error;
    NSArray *array=[self.managedObjectContxt executeFetchRequest:request
                                                    error:&error];
    return array;
}

- (id) findOne:(NSString *)modelName columnName:(NSString *)columnName columnValue:(id)columnValue valueType:(NSString *)format{
    NSFetchRequest *request=[self loadRequest:modelName];
    NSString *coreQL=[@"%@=%d" stringByReplacingOccurrencesOfString:@"%d" withString:format];
    coreQL=[NSString stringWithFormat:coreQL,columnName,columnValue];
    request.predicate=[NSPredicate predicateWithFormat:coreQL];
    NSArray *array=[self excuteRequest:request];
    if([array count]==0)
        return nil;
    return array[0];
}

- (NSArray *) query:(NSString *)modelName coreDataSQL:(NSString *)coreDataSQL{
    NSFetchRequest *request=[self loadRequest:modelName];
        request.predicate=[NSPredicate predicateWithFormat:coreDataSQL];
    NSArray *array=[self excuteRequest:request];
    return array;
}

@end
