# NSMutableURLRequest-MutilPartForm
发送POST可以请求上传任意格式的文件，例如音频，视频，html，txt等文件类型。

框架使用说明
1、将NSMutableURLRequest+MutilPartForm.h和NSMutableURLRequest+MutilPartForm.m分类导入到项目中
2、导入NSMutableURLRequest+MutilPartForm.h
3、修改NSMutableURLRequest+MutilPartForm.m文件上传文件的脚本的字段
4、创建负责上传文件的URL\n
5、调用requestWithURL:fileName:localFilePath:方法就实现了上传任意文件功能了

集成上传任意文件功能示例：
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
        
 
        if (connectionError) {
            [MBProgressHUD showError:@"上传失败"];
        } else {
            [MBProgressHUD showError:@"上传成功"];
        }
    }];

}
