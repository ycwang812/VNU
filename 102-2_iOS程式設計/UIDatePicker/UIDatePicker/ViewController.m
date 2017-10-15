//
//  ViewController.m
//  UIDatePicker
//
//  Created by CSIEVNUT403 on 2014/3/27.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)selectDate:(id)sender {
    
    UIDatePicker *datePicker = (UIDatePicker *) sender;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    [dateFormatter setDateFormat:@"yyyy/MM/dd"];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss zzz"];
    
    NSString *dateString = [dateFormatter stringFromDate:[datePicker date]];
    
    [self.label setText:dateString];
    
    //[dateFormatter release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
