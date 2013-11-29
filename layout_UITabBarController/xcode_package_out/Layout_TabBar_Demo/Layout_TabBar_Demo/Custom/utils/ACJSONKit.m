//
//  ACJSONKit.m
//  Layout_TabBar_Demo
//
//  Created by Albert Chu on 13-11-29.
//  Copyright (c) 2013年 Albert Chu. All rights reserved.
//

#import "ACJSONKit.h"

@implementation ACJSONKit

#pragma mark - Singleton

+ (ACJSONKit *)sharedInstance
{
    static dispatch_once_t pred;
    static ACJSONKit *sharedInstance = nil;
    
    dispatch_once(&pred, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}


- (NSDictionary *)readDataFromMainBundleBy:(NSString *)theJSONFileName
{
    NSString *mainBundleDirectory = [[NSBundle mainBundle] bundlePath];
    
    NSString *filePath = [mainBundleDirectory  stringByAppendingPathComponent:theJSONFileName];
    NSData *jsonData = [[NSData alloc] initWithContentsOfFile:filePath];
    
    
    /** 解析出的字典 */
    NSDictionary *resultDict;
    
    //-- json 解析 ---------------------------------------------------------------------------------
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData
                                                    options:NSJSONReadingAllowFragments // kNilOptions
                                                      error:&error];
    if (nil != jsonObject && error == nil)
    {
        //DLog(@"Successfully deserialized...");
        if ([jsonObject isKindOfClass:[NSDictionary class]])        /** 顶层对象是字典 */
        {
            resultDict = (NSDictionary *)jsonObject;
            //DLog(@"Dersialized JSON Dictionary = %@", resultDict);
        }
        
//        else if ([jsonObject isKindOfClass:[NSArray class]])        /** 顶层对象是数组 */
//        {
//            NSArray *deserializedArray = (NSArray *)jsonObject;
//            DLog(@"Dersialized JSON Array = %@", deserializedArray);
//        }
        
        else                                                        /** 错误 */
        {
            DLog(@"An error happened while deserializing the JSON data.");
        }
    }
    //---------------------------------------------------------------------------------------------;
    
    return resultDict;
}


@end
