//
//  MTTCoverFlowView.m
//  MTTCoverFlowView
//
//  Created by 刘浩 on 2017/11/14.
//  Copyright © 2017年 刘浩. All rights reserved.
//

#import "MTTCoverFlowView.h"
#import "MTTCoverFlowCollectionView.h"
#import "MTTCoverFlowLayout.h"
#import "MTTCoverFlowCell.h"

#define MaxSections 100

@interface MTTCoverFlowView ()<PageCardFlowLayoutDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic,strong)MTTCoverFlowCollectionView * pageCollectionView;
@property (nonatomic,strong)MTTCoverFlowLayout *layout ;
@property (nonatomic,strong)NSArray *dataSource;

@end 

@implementation MTTCoverFlowView

- (instancetype)init {
    self = [super init];
    if(self){
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (MTTCoverFlowCollectionView *)pageCollectionView {
    if(!_pageCollectionView){
        
        MTTCoverFlowLayout *layout = [[MTTCoverFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(100, 100);
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        layout.delegate = self;
        self.layout =layout;
        _pageCollectionView = [[MTTCoverFlowCollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        [_pageCollectionView registerNib:[UINib nibWithNibName:[MTTCoverFlowCell cellIdentifier] bundle:nil] forCellWithReuseIdentifier:[MTTCoverFlowCell cellIdentifier]];
        _pageCollectionView.delegate = self;
        _pageCollectionView.dataSource = self;

        _pageCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _pageCollectionView;
}


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self){
        self.pageCollectionView.frame = frame;
       
    }
    return self;
}

- (void)reloadCollectionViewData:(NSArray *)ary {
    if(!ary || ary.count ==0) return;
    
    self.dataSource = ary;
    [self addSubview:self.pageCollectionView];
    [self.pageCollectionView reloadData];
}







#pragma mark - UICollectionViewDelegate,UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MTTCoverFlowCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[MTTCoverFlowCell cellIdentifier] forIndexPath:indexPath];
//    cell.detailLabel.text = [self.dataSource[indexPath.row] stringValue];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if(_itemSelectedIndex){
        _itemSelectedIndex(indexPath.row);
    }
}

//定义每个Section的四边间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = ((collectionView.frame.size.width - 200)-(20*2))/2;
    return UIEdgeInsetsMake(0, width + 20, 0, width + 20);//分别为上、左、下、右
#if 0
    if (section == 0) {
        return UIEdgeInsetsMake(0, width + 10, 0, width + 10);//分别为上、左、下、右
    }
    else if(section == (MaxSections - 1)){
        return UIEdgeInsetsMake(0, 0, 0, width + 10);//分别为上、左、下、右
    }
    else{
        return UIEdgeInsetsMake(0, 10, 0, 0);//分别为上、左、下、右
    }
#endif
}


#pragma mark - PageCardFlowLayoutDelegate
- (void)scrollToPageIndex:(NSInteger)index{
    NSLog(@"当前选择的是第%ld页",((long)index % 8));
    if(_scrollEndedIndex){
        _scrollEndedIndex(index);
    }
}

@end
