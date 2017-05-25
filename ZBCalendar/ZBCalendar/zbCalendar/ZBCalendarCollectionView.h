//
//  ZBCalendarCollectionView.h
//  CustomCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBCalendarCollectionViewCell.h"
typedef void(^SelectedBlock)(NSDate* date);

@interface ZBCalendarCollectionView : UIView<UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView *collectionView;


@property (nonatomic, assign)NSInteger index;

@property (nonatomic, copy)SelectedBlock selectedBlock;
@end
