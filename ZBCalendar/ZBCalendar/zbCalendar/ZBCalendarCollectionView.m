//
//  ZBCalendarCollectionView.m
//  CustomCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import "ZBCalendarCollectionView.h"
#import "UIColor+Extension.h"
#define cellIdentifier @"reuse"
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.hight
#define BORDERWIDTH 0.5
#define BACKGROUND_COLOR @"#efefef"
@implementation ZBCalendarCollectionView
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //先实例化一个层
        
        UICollectionViewFlowLayout *layout=[[ UICollectionViewFlowLayout alloc ] init ];
        //创建一屏的视图大小
        [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView=[[ UICollectionView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[ZBCalendarCollectionViewCell class] forCellWithReuseIdentifier:cellIdentifier];
        _collectionView.layer.borderWidth = BORDERWIDTH;
        _collectionView.layer.borderColor = [UIColor colorWithHexString:BACKGROUND_COLOR].CGColor;
        _collectionView.backgroundColor =[UIColor colorWithHexString:BACKGROUND_COLOR];
        
        _collectionView.delegate = self ;
        
        _collectionView.dataSource = self ;
        
        [self addSubview:_collectionView];
        self.index = [NSDate getIndexForCurrent];
        
    }
    NSIndexPath *indexpath = [NSIndexPath indexPathForRow:self.index inSection:0];
    [_collectionView scrollToItemAtIndexPath:indexpath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    return self;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[NSDate date]getDayNumOfMonthForCurrentDay];
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ZBCalendarCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier :cellIdentifier forIndexPath:indexPath];
    [cell upLoadItemContentWithIndex:indexPath.row];
    [cell setSelectedStatus:indexPath.row == self.index];
    return cell;
}

- ( CGSize )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:( NSIndexPath *)indexPath
{
    
    return CGSizeMake ( kScreenW/5 ,kScreenW/5 );
    
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}

//定义每个UICollectionView 的边距

-( UIEdgeInsets )collectionView:( UICollectionView *)collectionView layout:( UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:( NSInteger )section
{
    return UIEdgeInsetsMake ( 0 , 0 , 0 , 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *cells = [collectionView visibleCells];
    for (ZBCalendarCollectionViewCell *cell0 in cells) {
        [cell0 setSelectedStatus:NO];
    }
    ZBCalendarCollectionViewCell * cell = (ZBCalendarCollectionViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    [cell setSelectedStatus:YES];
    self.index = indexPath.row;
    
    self.selectedBlock([NSDate getDateWithIndex:indexPath.row]);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
