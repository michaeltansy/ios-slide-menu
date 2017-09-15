//
//  MainViewController.m
//  project1
//
//  Created by Aloysius Tansy on 8/29/17.
//  Copyright © 2017 Aloysius Tansy. All rights reserved.
//

#import "MainViewController.h"
#import "TableView.h"
#import "ViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"

@interface MainViewController()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic) CGPoint startingPoint;
@property (nonatomic) CGPoint currentPoint;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) UINavigationController *navigationController;
@property (strong, nonatomic) NSArray *tableArray;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    _mainView = [[UIView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
//    [self.mainView setBackgroundColor:[UIColor redColor]];
    
    _tableArray = @[@"First", @"Second", @"Third"];
    _tabBarController = [[UITabBarController alloc] init];
    
    ViewController *viewController = [[ViewController alloc] init];
    SecondViewController *secondViewController = [[SecondViewController alloc] init];
    ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];
    
    viewController.title = @"First";
    secondViewController.title = @"Second";
    thirdViewController.title = @"Third";
    
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:viewController, secondViewController, thirdViewController,nil];
    
    _tableView = [[TableView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, CGRectGetWidth([UIScreen mainScreen].bounds), CGRectGetHeight([UIScreen mainScreen].bounds))];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(slide:)];
    panGesture.minimumNumberOfTouches = 1;
    
    [self.tabBarController.view addGestureRecognizer:panGesture];
    
    self.tabBarController.tabBar.hidden = YES;
    
    self.tableView.tableView.delegate = self;
    self.tableView.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.tabBarController.view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView

#pragma mark - Data Source
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 30.0f;
    
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
    
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.tableArray.count;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellIdentifier"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier"];
    
    cell.textLabel.text = [self.tableArray objectAtIndex:indexPath.row];
    //    if(indexPath.row ==3 ) cell.backgroundColor = [UIColor redColor];
    return cell;
    
}

#pragma mark Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //    NSLog(@"%@", indexPath);
    //    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //    NSString *cellText = cell.textLabel.text;
    NSInteger index = indexPath.row;
    self.tabBarController.selectedIndex = index;
    
    //    NSLog(@"selected index : %ld",self.tabBarController.selectedIndex);s
    
    self.tabBarController.view.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 50.0f, CGRectGetMinY(self.tabBarController.view.frame), CGRectGetWidth(self.tabBarController.view.frame), CGRectGetHeight(self.tabBarController.view.frame));
    [UIView animateWithDuration:0.3f animations:^{
        self.tabBarController.view.frame = CGRectMake(0.0f, CGRectGetMinY(self.tabBarController.view.frame), CGRectGetWidth(self.tabBarController.view.frame), CGRectGetHeight(self.tabBarController.view.frame));
    }];
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController {
    
//    self.tabBarController.selectedIndex = tabBarController.selectedIndex;
    
}

#pragma mark - CustomMethods

- (void)slide:(UIPanGestureRecognizer *)panGestureRecognizer{
    //    NSLog(@"Cunlai");
    CGPoint touchLocation = [panGestureRecognizer locationInView:self.view];
    
    if(panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        _startingPoint = touchLocation;
        //        NSLog(@"Touch Point Began: %f, %f", touchLocation.x, touchLocation.y);
        
    }
    else if(panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        //        NSLog(@"Touch Point Changed: %f, %f", touchLocation.x, touchLocation.y);
        
        CGFloat gapPoint = touchLocation.x - self.currentPoint.x;
        CGFloat newX = CGRectGetMinX(self.tabBarController.view.frame)+gapPoint;
        
        if(newX < 0.0f) {
            newX = 0.0f;
        }
        
        self.tabBarController.view.frame = CGRectMake(newX, CGRectGetMinY(self.tabBarController.view.frame), CGRectGetWidth(self.tabBarController.view.frame), CGRectGetHeight(self.tabBarController.view.frame));
    }
    else if(panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        //        NSLog(@"Touch Point Ended: %f, %f", touchLocation.x, touchLocation.y);
        
        [UIView animateWithDuration:0.3f animations:^{
            if(self.startingPoint.x < touchLocation.x) {
                self.tabBarController.view.frame = CGRectMake(CGRectGetWidth(self.view.frame) - 50.0f, CGRectGetMinY(self.tabBarController.view.frame), CGRectGetWidth(self.tabBarController.view.frame), CGRectGetHeight(self.tabBarController.view.frame));
            }
            else {
                self.tabBarController.view.frame = CGRectMake(0.0f, CGRectGetMinY(self.tabBarController.view.frame), CGRectGetWidth(self.tabBarController.view.frame), CGRectGetHeight(self.tabBarController.view.frame));
            }
            
        }];
        
    }
    
    self.currentPoint = touchLocation;
    
    //    NSLog(@"Touch Point: %f, %f", touchLocation.x, touchLocation.y);
}


@end
