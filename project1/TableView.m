//
//  TableView.m
//  project1
//
//  Created by Aloysius Tansy on 9/15/17.
//  Copyright © 2017 Aloysius Tansy. All rights reserved.
//

#import "TableView.h"

@interface TableView()

@end

@implementation TableView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self.backgroundColor = [UIColor whiteColor];
        
        _labelHeader = [[UILabel alloc] initWithFrame:CGRectMake(16.0f, 64.0f, CGRectGetWidth([UIScreen mainScreen].bounds)-32.0f , 20.0f)];
        self.labelHeader.textAlignment = NSTextAlignmentCenter;
        self.labelHeader.text = @"TableView";
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, CGRectGetMaxY(self.labelHeader.frame)+8.0f, CGRectGetWidth([UIScreen mainScreen].bounds),CGRectGetHeight([UIScreen mainScreen].bounds))];
        self.tableView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:self.labelHeader];
        [self addSubview:self.tableView];
    }
    return self;
}

@end
