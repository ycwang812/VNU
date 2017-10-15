//
//  ViewController.m
//  SliderDemo
//
//  Created by CSIEVNUT403 on 2014/3/13.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)onSliderValueChanged:(id)sender
{
    UISlider *slider = (UISlider *) sender;
    NSString *sliderValue = [[NSString alloc] initWithFormat:@"%d", (int) [slider value]];

    [self.label setText:sliderValue];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.label setText:@"5"];
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
