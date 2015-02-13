# NSMutableURLRequest-MutilPartForm
发送POST可以请求上传任意格式的文件，例如音频，视频，html，txt等文件类型。

框架使用说明
1、将NSMutableURLRequest+MutilPartForm.h和NSMutableURLRequest+MutilPartForm.m分类导入到项目中
2、导入NSMutableURLRequest+MutilPartForm.h
3、修改NSMutableURLRequest+MutilPartForm.m文件上传文件的脚本的字段
4、创建负责上传文件的URL
5、调用requestWithURL:fileName:localFilePath:方法就实现了上传任意文件功能了


