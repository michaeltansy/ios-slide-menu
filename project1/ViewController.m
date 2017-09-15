//
//  ViewController.m
//  project1
//
//  Created by Aloysius Tansy on 8/21/17.
//  Copyright © 2017 Aloysius Tansy. All rights reserved.
//

#import "ViewController.h"
#import "MainView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView {
    [super loadView];
    _mainView = [[MainView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    
    [self.view addSubview:self.mainView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.mainView setBackgroundColor:[UIColor blueColor]];
    NSLog(@"RUNNING");
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
