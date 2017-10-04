//
//  ViewController.m
//  SliderDemo
//
//  Created by CSIEVNUT403 on 2015/3/23.
//  Copyright (c) 2015年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *label;

@property (strong, nonatomic) IBOutlet UISlider *slider;

- (IBAction)onSliderValueChanged:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.slider setValue:10];
    [self.label setText:@"10"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSliderValueChanged:(id)sender {
    UISlider *slider = (UISlider *) sender;
    NSString *slderValue = [[NSString alloc] initWithFormat:@"%d", (int)[slider value]];
    
    [self.label setText:slderValue];
    NSLog(@"slider value = %@", slderValue);
}

@end
