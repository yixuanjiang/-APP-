//
//  UPScrollview.m
//  滚动视图引导界面
//
//  Created by iOS on 16/2/23.
//  Copyright (c) 2016年 . All rights reserved.
//

#import "UPScrollview.h"

@implementation UPScrollview

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
        self.pagingEnabled = YES;
        
        self.scrollEnabled = YES;
        //水平条隐藏
        self.showsHorizontalScrollIndicator = NO;
        
    }
    
    return self;
}

-(void)setImageCount:(NSArray *)arry
{
    self.contentSize = CGSizeMake(self.frame.size.width*arry.count, 0);
    for (int i=0; i<arry.count; i++) {
        
        UIImageView * imageview = [[UIImageView alloc]initWithFrame:CGRectMake(self.frame.size.width*i, 0, self.frame.size.width, self.frame.size.height)];
        [imageview setImage:[UIImage imageNamed:arry[i]]];
        imageview.userInteractionEnabled = YES;
        [self addSubview:imageview];
        
        CGFloat btnW = 100;
        CGFloat btnH = 30;
        CGFloat btnX = ([UIScreen mainScreen].bounds.size.width - btnW) * 0.5;
        CGFloat btnY = [UIScreen mainScreen].bounds.size.height - 100;
        if (i==arry.count-1) {
            
            UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
            button.layer.cornerRadius = 5;
            button.layer.masksToBounds = YES;
            button.layer.borderWidth = 1.5;
            button.layer.borderColor = [UIColor whiteColor].CGColor;
            [button setTitle:@"立即体验" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(button) forControlEvents:UIControlEventTouchUpInside];
            [imageview addSubview:button];
        }
    }
}

-(void)button
{
    //单例模式
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"Guide"];
    [defaults synchronize];//手动保存;
    
    
    UIWindow * wind =   [UIApplication sharedApplication].keyWindow;
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
//    wind.rootViewController=[storyboard instantiateInitialViewController];
    //已经登录过
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"login"]) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        wind.rootViewController=[storyboard instantiateInitialViewController];
        
    }else
    {
        YXHongBaoViewController *loginController = [[YXHongBaoViewController alloc] init];
        wind.rootViewController = loginController;
    }
  
    CATransition *transition = [CATransition animation];
    transition.type = @"push";
    transition.subtype = kCATransitionFromRight;
    transition.duration = 0.3;
    [wind.layer addAnimation:transition forKey:nil];

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
