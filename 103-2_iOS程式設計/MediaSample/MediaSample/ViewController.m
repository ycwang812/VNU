//
//  ViewController.m
//  MediaSample
//
//  Created by CSIEVNUT403 on 2015/3/16.
//  Copyright (c) 2015年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize audioPlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"神偷奶爸" ofType:@"m4a"];
    
    NSString *filePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"神偷奶爸.m4a"];
    
    NSLog(@"path=%@", filePath);
    
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    
    [self.audioPlayer prepareToPlay];
    [self.stopBtn setEnabled:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)play:(id)sender {
//    self.audioPlayer.currentTime = 0;
//    [self.audioPlayer setCurrentTime:0];
    
//    self.audioPlayer.play;
//    [self.audioPlayer play];
    
    NSLog(@"iPlaying:%d", [self.audioPlayer isPlaying]);
    
    if ([self.audioPlayer isPlaying]) {
        [self.audioPlayer pause];
        [self.startBtn setTitle:@"播放" forState:UIControlStateNormal];
        [self.stopBtn setEnabled:false];
    } else {
//        self.audioPlayer.currentTime = 0;
        [self.audioPlayer play];
        [self.startBtn setTitle:@"暫停" forState:UIControlStateNormal];
        [self.stopBtn setEnabled:true];
    }
}

- (IBAction)stop:(id)sender {
    [self.audioPlayer stop];
//    self.audioPlayer.stop;
    
    NSLog(@"iPlaying:%d", [self.audioPlayer isPlaying]);

    [self.startBtn setTitle:@"播放" forState:UIControlStateNormal];
    [self.startBtn setEnabled:true];
    [self.stopBtn setEnabled:false];
    
    self.audioPlayer.currentTime = 0;
}

@end
