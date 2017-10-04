//
//  ViewController.m
//  DatePickerDemo
//
//  Created by CSIEVNUT403 on 2015/3/23.
//  Copyright (c) 2015年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

- (IBAction)selectDate:(id)sender;

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

- (IBAction)selectDate:(id)sender {
    UIDatePicker *datePicker = (UIDatePicker *) sender;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy/MM/dd hh:mm:ss"];
    
    NSString *dateString = [dateFormatter stringFromDate:[datePicker date]];
    
    [self.label setText:dateString];
}

@end
