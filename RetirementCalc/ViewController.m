//
//  ViewController.m
//  RetirementCalc
//
//  Created by Derrick Fox on 1/15/15.
//  Copyright (c) 2015 Derrick Fox. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+Utilities.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButton:(id)sender {
    NSString *savingsString = self.savingsText.text;
    float savingsFloat = [savingsString floatValue];
    NSString *monthlySpendingString = self.monthSpendingText.text;
    float monthlySpendingfloat = [monthlySpendingString floatValue];
    
    float numberOfDays = (savingsFloat / monthlySpendingfloat) * 31;
    
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"MMM dd, yyyy"];
    NSDate *date = [NSDate date];
    NSString *formattedDateString = [dateFormatter stringFromDate:date];
    
    NSDate *dateAfternDays = [NSDate dateWithDaysFromNow:numberOfDays];
    NSString *formattedDateAfternDays = [dateFormatter stringFromDate:dateAfternDays];
    
    NSLog(@"Todays Date is %@",formattedDateString );
    NSLog(@"Date After 2 days will be%@",formattedDateAfternDays );
    self.dateText.text = formattedDateAfternDays;
    
    //////////////////////////////////////////////////////////////////////////////////////////////
    NSDateFormatter *dateFormatter2 = [[NSDateFormatter alloc] init];
    [dateFormatter2 setDateFormat:@"dd-MMM-yyyy"];
    NSDate *startD = [dateFormatter2 dateFromString:@"26-Oct-1983"];
    NSDate *endD = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|     NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:startD toDate:endD options:0];
    
    NSInteger year  = [components year];
    NSInteger month  = [components month];
    NSInteger day  = [components day];
    
    NSInteger *age = (year) + ((NSInteger)numberOfDays / 365);
    
    NSString *ageString = [NSString stringWithFormat: @"%ld", (long)age];
    self.ageText.text = ageString;
    
    NSLog(@"%ld:%ld:%ld", (long)year, (long)month,(long)day);
    /*
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"MM/dd/yyyy";
    NSDate *born = [mmddccyy dateFromString:@"10/26/1983"];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/yyyy"];
    
    //Optionally for time zone conversions
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"..."]];
    
    NSString *stringFromDate = [formatter stringFromDate:born];
    self.ageText.text = stringFromDate;
        
    /*
    NSString *monthsString = [NSString stringWithFormat:@"%d",numberOfDays];
    self.dateText.text = monthsString;
     */
}

- (IBAction)hideKeyboard:(id)sender {
    [self.savingsText resignFirstResponder];
    [self.monthSpendingText resignFirstResponder];
}
@end
