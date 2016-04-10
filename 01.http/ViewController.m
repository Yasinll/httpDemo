//
//  ViewController.m
//  01.http
//
//  Created by 浅爱 on 16/3/2.
//  Copyright © 2016年 my. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *myWebView;

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    
    [self demo];
}

// http访问百度
- (void)demo {

    // 1.获取url
    NSURL *url = [NSURL URLWithString:@"http:www.baidu.com"];
    
    // 2.符合http格式的网络请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.连接到百度
    /** 1.请求  2.队列  3.完成的时候回调block*/
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        /*
         1.response 响应头
         2.data 数据 响应体
         3.connectionError 连接错误
         */
        
        // 判断是否连接错误
        if (connectionError) {
            
            NSLog(@"connectionError %@", connectionError);
            
            return ;
            
        }
        
        // 得到响应体的数据
        // 网络上传输的都是二进制数据 0101010
        // 从二进制转换到看得懂的字符
        /*
         1.二进制数据
         2.编码
         */
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", str);
        
        // 加载到webView上
        [self.myWebView loadHTMLString:str baseURL:nil];
        
    }];
    
}

@end






