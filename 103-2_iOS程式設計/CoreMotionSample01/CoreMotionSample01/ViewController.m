//
//  ViewController.m
//  CoreMotionSample01
//
//  Created by CSIEVNUT403 on 2015/6/8.
//  Copyright (c) 2015年 403. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UILabel *accelerationX;
@property (strong, nonatomic) IBOutlet UILabel *accelerationY;
@property (strong, nonatomic) IBOutlet UILabel *accelerationZ;

@property (strong, nonatomic) CMMotionManager *motionManager;

- (void)strtGetAcceleration;
- (void)stopGetAcceleration;
- (void)getAcceleration;
- (void)showAcceleration;
- (void)autoGetAcceleration;

@end

@implementation ViewController

double accelerationData[3];

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.2;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self outputAccelertionData:accelerometerData.acceleration];
        
            if (error) {
                NSLog(@"%@", error);
            }
        }];
    
//    if (self.motionManager.accelerometerAvailable) {
//        memset(accelerationData, 0, sizeof(accelerationData));
//        
//        NSTimer *aTimer = [[NSTimer alloc] init];
//        aTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(showAcceleration) userInfo:nil repeats:NO];
//        
//        [self autoGetAcceleration];
//    } else {
//        NSLog(@"Don't support accelerometer");
//    }
}

- (void)outputAccelertionData:(CMAcceleration)acceleration {
    
    self.accelerationX.text = [NSString stringWithFormat:@"%f g", acceleration.x];
    self.accelerationY.text = [NSString stringWithFormat:@"%f g", acceleration.y];
    self.accelerationZ.text = [NSString stringWithFormat:@"%f g", acceleration.z];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)strtGetAcceleration {
    self.motionManager.accelerometerUpdateInterval = 0.01;
    [[self motionManager] startAccelerometerUpdates];
}

- (void)stopGetAcceleration {
    if (self.motionManager.accelerometerActive) {
        [[self motionManager] stopAccelerometerUpdates];
    }
}

- (void)getAcceleration {
    CMAccelerometerData *newestAccel = [[self motionManager] accelerometerData];
    
    accelerationData[0] = newestAccel.acceleration.x;
    accelerationData[1] = newestAccel.acceleration.y;
    accelerationData[2] = newestAccel.acceleration.z;
}

- (void)showAcceleration {
    [self getAcceleration];
    
    self.accelerationX.text = [NSString stringWithFormat:@"%f", accelerationData[0]];
    self.accelerationY.text = [NSString stringWithFormat:@"%f", accelerationData[1]];
    self.accelerationZ.text = [NSString stringWithFormat:@"%f", accelerationData[2]];
}

- (void)autoGetAcceleration {
    [[self motionManager] startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData *acceleData, NSError *error) {
        CMAcceleration accel = acceleData.acceleration;
        NSLog(@"rotationrate:%f, %f, %f", accel.x, accel.y, accel.z);
    }];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
