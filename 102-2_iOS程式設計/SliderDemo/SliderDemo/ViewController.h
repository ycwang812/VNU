//
//  ViewController.h
//  SliderDemo
//
//  Created by CSIEVNUT403 on 2014/3/13.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *label;

- (IBAction)onSliderValueChanged:(id)sender;

@end
