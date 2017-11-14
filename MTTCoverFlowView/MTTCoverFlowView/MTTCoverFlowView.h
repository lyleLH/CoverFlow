//
//  MTTCoverFlowView.h
//  MTTCoverFlowView
//
//  Created by 刘浩 on 2017/11/14.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^IntegerBlock)(NSInteger integer);

@interface MTTCoverFlowView : UIView

@property (nonatomic,copy)IntegerBlock scrollEndedIndex;
@property (nonatomic,copy)IntegerBlock itemSelectedIndex;

- (void)reloadCollectionViewData:(NSArray *)ary ;

@end
