//
//  ViewController.m
//  ZBCalendar
//
//  Created by 清科 on 2017/5/25.
//  Copyright © 2017年 清科. All rights reserved.
//

#import "ViewController.h"
#import "ZBCalendarCollectionView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ZBCalendarCollectionView*collection = [[ZBCalendarCollectionView alloc]initWithFrame:CGRectMake(0, 100, CGRectGetWidth(self.view.frame), 80)];
    collection.selectedBlock = ^(NSDate* date){
        NSDateFormatter *year = [[NSDateFormatter alloc]init];
        [year setDateFormat:@"yyyy"];
        NSString *yearstr = [year stringFromDate:date];
        NSDateFormatter *month = [[NSDateFormatter alloc]init];
        [month setDateFormat:@"MM"];
        NSString *monthstr = [month stringFromDate:date];
        NSDateFormatter *day = [[NSDateFormatter alloc]init];
        [day setDateFormat:@"dd"];
        NSString *daystr = [day stringFromDate:date];
        
        
        
        NSLog(@"%@:%@:%@",yearstr,monthstr,daystr);
    };
    
    [self.view addSubview:collection];
    // Do any additional setup after loading the view, typically from a nib.
}


@end
