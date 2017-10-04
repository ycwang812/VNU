//
//  ViewController.m
//  CoreMotionSample02
//
//  Created by CSIEVNUT403 on 2015/6/8.
//  Copyright (c) 2015年 403. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *gyroX;
@property (strong, nonatomic) IBOutlet UILabel *gyroY;
@property (strong, nonatomic) IBOutlet UILabel *gyroZ;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.gyroUpdateInterval = 0.2;
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData *gyroData, NSError *error) {
        
        [self outputRotationData:gyroData.rotationRate];
        
        if (error) {
            NSLog(@"%@", error);
        }
    }];
}

- (void)outputRotationData:(CMRotationRate)rotation {
    self.gyroX.text = [NSString stringWithFormat:@"%f r/s", rotation.x];
    self.gyroY.text = [NSString stringWithFormat:@"%f r/s", rotation.y];
    self.gyroZ.text = [NSString stringWithFormat:@"%f r/s", rotation.z];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
