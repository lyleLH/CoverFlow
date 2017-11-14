//
//  MTTCoverFlowLayout.h
//  MTTCoverFlowView
//
//  Created by 刘浩 on 2017/11/14.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PageCardFlowLayoutDelegate <NSObject>

- (void)scrollToPageIndex:(NSInteger)index;

@end


@interface MTTCoverFlowLayout : UICollectionViewFlowLayout
@property (nonatomic, assign) CGFloat previousOffsetX;
@property (nonatomic,weak) id<PageCardFlowLayoutDelegate> delegate;
@end
