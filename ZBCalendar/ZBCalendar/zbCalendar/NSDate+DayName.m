//
//  NSDate+DayName.m
//  CustomCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import "NSDate+DayName.h"

@implementation NSDate (DayName)
///当前月的天数
- (NSInteger)getDayNumOfMonthForCurrentDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:self];
    return range.length;
}

+(NSString *)getMonthByMonth:(NSInteger)month{
    NSArray *arr = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",];
    return arr[month-1];
}

+(NSString *)getMonth
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSInteger month = [[[currentDateStr componentsSeparatedByString:@"-"]objectAtIndex:1]integerValue];
    
    
    NSArray *arr = @[@"一月",@"二月",@"三月",@"四月",@"五月",@"六月",@"七月",@"八月",@"九月",@"十月",@"十一月",@"十二月",];
    return arr[month-1];
}

+ (NSInteger)getIndexForCurrent
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSInteger day = [[[currentDateStr componentsSeparatedByString:@"-"]objectAtIndex:2]integerValue];
    return day-1;
}

+(NSDate *)getDateWithIndex:(NSInteger)index
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSInteger day = [[[currentDateStr componentsSeparatedByString:@"-"]objectAtIndex:2]integerValue];
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:-(day-index-1)*24*60*60];
    return newDate;
}

+(NSString *)getWeekByWeekday:(NSInteger)weekday{
    switch (weekday) {
        case 1:
            return @"周日";
            break;
        case 2:
            return @"周一";
            break;
        case 3:
            return @"周二";
            break;
        case 4:
            return @"周三";
            break;
        case 5:
            return @"周四";
            break;
        case 6:
            return @"周五";
            break;
        case 7:
            return @"周六";
            break;
        default:
            return @"";
            break;
    }
}

+(NSString *)getWeekWith:(NSInteger)index
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd-HH:mm:ss"];
    NSString *currentDateStr = [dateFormatter stringFromDate:[NSDate date]];
    NSInteger day = [[[currentDateStr componentsSeparatedByString:@"-"]objectAtIndex:2]integerValue];
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceNow:-(day-index-1)*24*60*60];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags =NSCalendarUnitYear | NSCalendarUnitMonth |NSCalendarUnitDay | NSCalendarUnitWeekday |
    NSCalendarUnitHour |NSCalendarUnitMinute | NSCalendarUnitSecond;
    comps = [calendar components:unitFlags fromDate:newDate];
    return [self getWeekByWeekday:comps.weekday];
}

@end
