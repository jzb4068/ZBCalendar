//
//  ZBCalendarCollectionViewCell.h
//  CustomCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSDate+DayName.h"
@interface ZBCalendarCollectionViewCell : UICollectionViewCell
@property(nonatomic,strong) UIView *nowdayView;
@property (nonatomic, strong)UILabel *dayLabel;

@property (nonatomic, strong)UILabel *monthLabel;

@property (nonatomic, strong)UILabel *weekLabel;

@property (nonatomic, strong)UIView *sep;

-(void)upLoadItemContentWithIndex:(NSInteger)index;

-(void)setSelectedStatus:(BOOL)selected;
@end
