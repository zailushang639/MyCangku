//
//  ViewController.m
//  erWeiMa
//
//  Created by 票金所 on 16/6/17.
//  Copyright © 2016年 杨晨晨. All rights reserved.
//  利用网址生成二维码,扫码跳到链接

#import "ViewController.h"

@interface ViewController ()
{
    UIImageView *iv;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor lightGrayColor];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str=@"https://itunes.apple.com/cn/app/id1055279350?";
    // 1. 实例化二维码滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    // 2. 恢复滤镜的默认属性
    [filter setDefaults];
    
    // 3. 将字符串转换成NSData
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
    // 4. 通过KVO设置滤镜inputMessage数据
    [filter setValue:data forKey:@"inputMessage"];
    
    // 5. 获得滤镜输出的图像
    CIImage *outputImage = [filter outputImage];
    
    // 6. 将CIImage转换成UIImage，并放大显示
    UIImage *viewImage = [UIImage imageWithCIImage:outputImage scale:0.2 orientation:UIImageOrientationUp];
    //UIImage *viewImage = [UIImage  imageWithCIImage:outputImage];
    iv=[[UIImageView alloc]initWithImage:viewImage];
    iv.center=CGPointMake(150, 200);
    [self.view addSubview:iv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
