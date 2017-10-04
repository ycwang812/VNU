//
//  ViewController.m
//  SwitchDemo
//
//  Created by CSIEVNUT403 on 2015/3/23.
//  Copyright (c) 2015年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UISwitch *switcher;

@property (strong, nonatomic) IBOutlet UILabel *label;

- (IBAction)switchOnOff:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.switcher setOn:false];
    self.label.text = @"false";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchOnOff:(id)sender {
    UISwitch *switcher = (UISwitch *)sender;
//    self.label.text = [NSString stringWithFormat:@"%d", [switcher isOn]];
//    [self.label setText:[NSString stringWithFormat:@"%d", [switcher isOn]];
    
    NSLog(@"%d", [switcher isOn]);
    
    if ([switcher isOn]) {
        self.label.text = @"true";
    } else {
        self.label.text = @"false";
    }
}

@end
