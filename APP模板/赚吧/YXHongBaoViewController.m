//
//  YXHongBaoViewController.m
//  赚吧
//
//  Created by 265g on 16/6/30.
//  Copyright © 2016年 Company. All rights reserved.
//

#import "YXHongBaoViewController.h"

@interface YXHongBaoViewController ()

@property (nonatomic,strong)UIButton *loginBtn;
@end

@implementation YXHongBaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    //创建登录的按钮
    UIButton *loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIGHT / 2 - 50, SCREEN_HEIGHT / 2, 100, 30)];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor blueColor];
    [loginBtn addTarget:self action:@selector(loginButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    self.loginBtn = loginBtn;
    
    
}

- (void)loginButtonClick
{
    //单例模式
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"login"];
    [defaults synchronize];//手动保存;
    
    UIWindow * wind =   [UIApplication sharedApplication].keyWindow;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    wind.rootViewController=[storyboard instantiateInitialViewController];
    
    NSLog(@"-------%s",__func__);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
