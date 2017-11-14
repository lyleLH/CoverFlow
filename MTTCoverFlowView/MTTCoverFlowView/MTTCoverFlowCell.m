//
//  MTTCoverFlowCell.m
//  MTTCoverFlowView
//
//  Created by 刘浩 on 2017/11/14.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "MTTCoverFlowCell.h"
#import "UIColor+MTTCategory.h"
@implementation MTTCoverFlowCell

+ (NSString *)cellIdentifier {
    
    return @"MTTCoverFlowCell";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.layer.cornerRadius = 5;
    self.layer.masksToBounds = true;
    self.backgroundColor = [UIColor mtt_randomColor];
}

@end
