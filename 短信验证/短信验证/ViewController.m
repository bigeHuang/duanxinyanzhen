//
//  ViewController.m
//  短信验证
//
//  Created by 黄建鸿 on 15/9/2.
//  Copyright (c) 2015年 黄建鸿. All rights reserved.
//

#import "ViewController.h"
#import <SMS_SDK/SMS_SDK.h>
#import "SVProgressHUD.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *phoneText;

@property (weak, nonatomic) IBOutlet UITextField *numCodeText;

@end

@implementation ViewController
//发送按钮
- (IBAction)send:(id)sender {
    
    [SMS_SDK getVerificationCodeBySMSWithPhone:self.phoneText.text zone:@"86" result:^(SMS_SDKError *error) {
        
        if (error == nil) {
            NSLog(@"发送成功！");
        }else
        {
            NSLog(@"发送失败！");
        }
        
    }];
    
}
//验证按钮
- (IBAction)proving:(id)sender {
    
    [SVProgressHUD showWithStatus:@"验证成功！！"];
    
    [SMS_SDK commitVerifyCode:self.numCodeText.text result:^(enum SMS_ResponseState state) {
        if (state == SMS_ResponseStateSuccess) {
            NSLog(@"验证成功");
            [SVProgressHUD showSuccessWithStatus:@"验证成功！！"];
        }
        
        if (state == SMS_ResponseStateFail) {
            NSLog(@"验证失败！！");
            
            [SVProgressHUD showErrorWithStatus:@"验证失败！！"];
        }
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
