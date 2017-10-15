//
//  ViewController.m
//  MediaSample
//
//  Created by CSIEVNUT403 on 2014/5/1.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize playBtn, stopBtn, audioPlayer;

- (IBAction)play:(id)sender {
    self.audioPlayer.currentTime = 0;
    [self.audioPlayer play];
    //self.audioPlayer.play;
}

- (IBAction)stop:(id)sender {
    [self.audioPlayer stop];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"music" ofType:@"m4a"];
    NSURL *fileURL = [[NSURL alloc] initFileURLWithPath:filePath];
    
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:fileURL error:nil];
    [self.audioPlayer prepareToPlay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
