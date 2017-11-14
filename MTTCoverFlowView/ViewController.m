//
//  ViewController.m
//  MTTCoverFlowView
//
//  Created by 刘浩 on 2017/11/14.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "ViewController.h"
#import "MTTCoverFlowView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *backgroundView;

@property (nonatomic,strong)NSArray * dataSource;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    MTTCoverFlowView * coverFlow = [[MTTCoverFlowView alloc] initWithFrame:self.backgroundView.bounds];
    
    [coverFlow reloadCollectionViewData:[NSMutableArray arrayWithArray:@[@0,@1,@2,@3,@4,@5,@6,@7]]];
    
    coverFlow.scrollEndedIndex = ^(NSInteger integer) {
        
    };
    [self.backgroundView addSubview:coverFlow];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
