//
//  NSMutableURLRequest+MutilPartForm.m
//  01-POST上传文件
//
//  Created by apple on 15-1-2.
//  Copyright (c) 2015年 solot. All rights reserved.
//

#import "NSMutableURLRequest+MutilPartForm.h"

/** static boundary 在静态区，itcastupload在常量区 */
static NSString *boundary = @"uploadFile";
/** userfile 是 负责上传文件 php 脚本中的字段,此处需要修改默认为PHP脚本字段 */
static NSString *serverField = @"userfile";

@implementation NSMutableURLRequest (MutilPartForm)

/**
 *  建立要上传文件的请求
 *
 *  @param URL           负责上传文件的 php 脚本
 *  @param fileName      保存在服务器上的文件名
 *  @param localFilePath 本地要上传文件的完整路径
 *
 *  @return 包含拼接好数据体的请求
 */
+ (instancetype)requestWithURL:(NSURL *)URL fileName:(NSString *)fileName localFilePath:(NSString *)localFilePath {
    // 创建一个NSMutableURLRequest
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    
    // 指定HTTP方法
    request.HTTPMethod = @"POST";
    
    // 指定 HTTP 数据体
  
    // 准备二进制数据
    NSMutableData *dataM = [NSMutableData data];
    NSString *bodyStr = [NSString stringWithFormat:@"\n--%@\n", boundary];
    [dataM appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    bodyStr = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"%@\" \n", serverField, fileName];
    [dataM appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    bodyStr = [NSString stringWithFormat:@"Content-Type: application/stream\n\n"];
    [dataM appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 要上传文件的二进制数据
    [dataM appendData:[NSData dataWithContentsOfFile:localFilePath]];
    bodyStr = [NSString stringWithFormat:@"\n\n--%@--\n", boundary];
    [dataM appendData:[bodyStr dataUsingEncoding:NSUTF8StringEncoding]];
    
    // 设置 request 的 HTTPBody
    request.HTTPBody = dataM;
    
    // 设置请求头的 Content-type，告诉服务器，客户端要上传文件
    // forHTTPHeaderField 所有开发中，要告诉服务器额外的信息，都用这个属性设置！
    NSString *headerStr = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:headerStr forHTTPHeaderField:@"Content-Type"];

    return request;
}

@end
