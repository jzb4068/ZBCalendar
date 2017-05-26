![image](https://raw.githubusercontent.com/jzb4068/ZBCalendar/master/ZBCalendar/GIF/演示.gif)
## **示例代码**：

### 初始化并设置header与bar
```objc
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
```
