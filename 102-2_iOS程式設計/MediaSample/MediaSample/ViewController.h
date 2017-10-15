//
//  ViewController.h
//  MediaSample
//
//  Created by CSIEVNUT403 on 2014/5/1.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *playBtn;
@property (weak, nonatomic) IBOutlet UIButton *stopBtn;
@property AVAudioPlayer *audioPlayer;

- (IBAction)play:(id)sender;
- (IBAction)stop:(id)sender;

@end
