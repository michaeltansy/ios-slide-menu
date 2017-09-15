//
//  ThirdViewController.m
//  project1
//
//  Created by Aloysius Tansy on 9/15/17.
//  Copyright © 2017 Aloysius Tansy. All rights reserved.
//

#import "ThirdViewController.h"
#import "ThirdView.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _thirdView = [[ThirdView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    
    [self.view addSubview:self.thirdView];
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
