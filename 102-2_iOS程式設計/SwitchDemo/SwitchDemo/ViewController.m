//
//  ViewController.m
//  SwitchDemo
//
//  Created by CSIEVNUT403 on 2014/3/13.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)switchOnOff:(id)sender
{
    UISwitch *switcher = (UISwitch *) sender;
    
    NSLog(@"%d", [switcher isOn]);
    
    switch ([switcher isOn]) {
        case 0:
            self.label.text = @"Off";
            break;
        case 1:
            self.label.text = @"On";
            break;
    }
    
    //self.label.text = [[NSString alloc] initWithFormat:@"%d", [switcher isOn]];
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
