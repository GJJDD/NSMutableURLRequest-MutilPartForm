//
//  ViewController.m
//  uploadingFile
//
//  Created by apple on 15/2/14.
//  Copyright (c) 2015年 solot. All rights reserved.
//

#import "ViewController.h"
#import "NSMutableURLRequest+MutilPartForm.h"
#import "MBProgressHUD+MJ.h"
@interface ViewController ()
/**
 *  上传文件的url
 */
@property (weak, nonatomic) IBOutlet UITextField *uploadFileurl;
/**
 *  上传文件
 */
- (IBAction)uploadClick;

@end

@implementation ViewController



- (IBAction)uploadClick {
    
    // 1. url 是负责上传文件的 php 脚本(每个公司上传文件的脚本可能是不一样的，原理都是一样的)
    
    if ([self.uploadFileurl.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"请填写需要上传的url"];
        return;
    }
    NSURL *url = [NSURL URLWithString:self.uploadFileurl.text];
    
    // 2. request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url fileName:@"testFile.jpg" localFilePath:[[NSBundle mainBundle] pathForResource:@"testFile.jpg" ofType:nil]];
    
    // 3. connection
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
//        id result = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
 
        if (connectionError) {
            [MBProgressHUD showError:@"上传失败"];
        } else {
            NSLog(@"上传成功");
        }
    }];

}
@end
