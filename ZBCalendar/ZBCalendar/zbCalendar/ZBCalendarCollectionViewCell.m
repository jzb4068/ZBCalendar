//
//  ZBCalendarCollectionViewCell.m
//  CustomCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import "ZBCalendarCollectionViewCell.h"
#import "UIColor+Extension.h"
#define LIGHTGRAY_COLOR @"666666"
#define BACKGROUND_COLOR @"#efefef"
#define COMMON_COLOR @"#12b7f6"
#define SEP_HEIGHT 5
@implementation ZBCalendarCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _dayLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 4, frame.size.width/2.0, frame.size.height/2.0)];
        _dayLabel.backgroundColor = [UIColor clearColor];
        _dayLabel.textAlignment = NSTextAlignmentCenter;
        _dayLabel.font = [UIFont systemFontOfSize:17];
        [self addSubview:_dayLabel];
        _weekLabel = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.width/2.0, 4, frame.size.width/2.0,frame.size.height/2.0)];
        _weekLabel.backgroundColor = [UIColor clearColor];
        _weekLabel.textAlignment = NSTextAlignmentLeft;
        _weekLabel.textColor = [UIColor colorWithHexString:LIGHTGRAY_COLOR];
        _weekLabel.font = [UIFont systemFontOfSize:12];
        [self addSubview:_weekLabel];
        _monthLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, frame.size.height/2.0, frame.size.width, frame.size.height/2.0-6)];
        _monthLabel.backgroundColor = [UIColor clearColor];
        _monthLabel.font = [UIFont systemFontOfSize:12];
        _monthLabel.textColor = [UIColor colorWithHexString:LIGHTGRAY_COLOR];
        _monthLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_monthLabel];
        _nowdayView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, CGRectGetWidth(frame)-20, CGRectGetHeight(frame)-20)];
        _nowdayView.layer.cornerRadius = (frame.size.width-20)/2;
        _nowdayView.layer.masksToBounds = YES;
        //        [self addSubview:_nowdayView];
        _sep = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-SEP_HEIGHT, frame.size.width, SEP_HEIGHT)];
        _sep.backgroundColor = [UIColor whiteColor];
        [self addSubview:_sep];
    }
    return self;
}
-(void)setSelectedStatus:(BOOL)selected
{
    self.sep.backgroundColor = selected ? [UIColor colorWithHexString:COMMON_COLOR]:[UIColor colorWithHexString:BACKGROUND_COLOR];
}


- (BOOL)isNowDay:(NSString *)day week:(NSString *)week month:(NSString *)month{
    
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitWeekday;
    comps = [calendar components:unitFlags fromDate:date];
    NSInteger week1 = [comps weekday];
    //    NSInteger year1 =[comps year];
    NSInteger month1 = [comps month];
    NSInteger day1 = [comps day];
    BOOL isDay = NO;
    if ([week isEqualToString:[NSDate getWeekByWeekday:week1]] && [month isEqualToString:[NSDate getMonthByMonth:month1]] && [day integerValue] == day1) {
        isDay = YES;
    }else{
        isDay = NO;
    }
    return isDay;
}

-(void)upLoadItemContentWithIndex:(NSInteger)index
{
    _dayLabel.text = [NSString stringWithFormat:@"%ld",(long)index+1];
    _weekLabel.text = [NSDate getWeekWith:index];
    _monthLabel.text = [NSDate getMonth];
    if ([self isNowDay:_dayLabel.text week:_weekLabel.text month:_monthLabel.text]) {
        self.nowdayView.backgroundColor = [UIColor colorWithHexString:COMMON_COLOR alpha:0.5];
        _dayLabel.textColor = [UIColor colorWithHexString:COMMON_COLOR];
        _weekLabel.textColor = [UIColor colorWithHexString:COMMON_COLOR];
        _monthLabel.textColor = [UIColor colorWithHexString:COMMON_COLOR];
    }else{
        self.nowdayView.backgroundColor = [UIColor clearColor];
        _dayLabel.textColor = [UIColor colorWithHexString:LIGHTGRAY_COLOR];
        _weekLabel.textColor = [UIColor colorWithHexString:LIGHTGRAY_COLOR];
        _monthLabel.textColor = [UIColor colorWithHexString:LIGHTGRAY_COLOR];
    }
}

@end
