//
//  UPScrollController.m
//  滚动视图引导界面
//
//  Created by iOS on 16/2/23.
//  Copyright (c) 2016年 . All rights reserved.
//

#import "UPScrollController.h"
#import "UPScrollview.h"

@interface UPScrollController ()

@end

@implementation UPScrollController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UPScrollview * sv = [[UPScrollview alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:sv];
    
    NSArray * arryimage = [NSArray arrayWithObjects:@"guide_0",@"guide_1",@"guide_2",@"guide_3", nil];
    [sv setImageCount:arryimage];
    
    
    
    
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
