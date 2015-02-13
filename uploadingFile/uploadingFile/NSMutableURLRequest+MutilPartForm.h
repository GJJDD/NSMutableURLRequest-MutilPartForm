//
//  NSMutableURLRequest+MutilPartForm.h
//  01-POST上传文件
//
//  Created by apple on 15-1-2.
//  Copyright (c) 2015年 solot. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableURLRequest (MutilPartForm)

/**
 *  建立要上传文件的请求
 *
 *  @param URL           负责上传文件的 php 脚本
 *  @param fileName      保存在服务器上的文件名
 *  @param localFilePath 本地要上传文件的完整路径
 *
 *  @return 包含拼接好数据体的请求
 */
+ (instancetype)requestWithURL:(NSURL *)URL fileName:(NSString *)fileName localFilePath:(NSString *)localFilePath;

@end
