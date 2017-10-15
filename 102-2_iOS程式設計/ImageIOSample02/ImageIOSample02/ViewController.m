//
//  ViewController.m
//  ImageIOSample02
//
//  Created by CSIEVNUT403 on 2014/5/22.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)showImages
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"IMG_4079.JPG" withExtension:nil];
    
    CGImageSourceRef myImageSource = CGImageSourceCreateWithURL((__bridge CFURLRef) modelURL, NULL);
    
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(myImageSource, 0, NULL);
    
    int imageSize = 240;
    CFNumberRef thumbnailSize = CFNumberCreate(NULL, kCFNumberIntType, &imageSize);
    CFTypeRef isCreateThumbnail = kCFBooleanTrue;
    
    NSString *createThumbnailaFromImage = (NSString *) kCGImageSourceCreateThumbnailFromImageIfAbsent;
    NSString *thumbnailMaxSize = (NSString *) kCGImageSourceThumbnailMaxPixelSize;
    
    NSDictionary *options = [[NSDictionary alloc] initWithObjectsAndKeys:(__bridge id)((void *) isCreateThumbnail), (void *) createThumbnailaFromImage, (void *) thumbnailSize, (void *) thumbnailMaxSize, nil];
    
    CGImageRef image = CGImageSourceCreateImageAtIndex(myImageSource, 0, NULL);
    CGImageRef thumbnailImage = CGImageSourceCreateImageAtIndex(myImageSource, 0, (__bridge CFDictionaryRef) options);
    
    [[self myImageView] setImage:[UIImage imageWithCGImage:image]];
    [[self myThumbnaiView] setImage:[UIImage imageWithCGImage:thumbnailImage]];
    
    CFRelease(myImageSource);
    CFRelease(imageProperties);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self showImages];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
