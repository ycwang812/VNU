//
//  ViewController.h
//  MediaSample
//
//  Created by CSIEVNUT403 on 2015/3/16.
//  Copyright (c) 2015年 CSIEVNUT403. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewController : UIViewController {

    AVAudioPlayer *audioPlayer;
    
}

@property (strong, nonatomic) IBOutlet UIButton *startBtn;
@property (strong, nonatomic) IBOutlet UIButton *stopBtn;
@property (nonatomic, retain) AVAudioPlayer *audioPlayer;

- (IBAction)play:(id)sender;

- (IBAction)stop:(id)sender;

@end

