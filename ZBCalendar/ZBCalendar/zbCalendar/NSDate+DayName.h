//
//  NSDate+DayName.h
//  CustomCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DayName)
- (NSInteger)getDayNumOfMonthForCurrentDay;

+(NSString *)getWeekWith:(NSInteger)index;
+(NSString *)getWeekByWeekday:(NSInteger)weekday;
+(NSString *)getMonth;
+(NSString *)getMonthByMonth:(NSInteger)month;
+ (NSInteger)getIndexForCurrent;
+(NSDate *)getDateWithIndex:(NSInteger)index;
@end
