//
//  ViewController.m
//  ImageIOSample01
//
//  Created by CSIEVNUT403 on 2014/5/8.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)getImageFromWeb
{
    CFURLRef url = (__bridge CFURLRef) [NSURL URLWithString:@"http://pic.pimg.tw/rita26/ff6b8b83bf6868641013c85a56df783d.jpg"];
    
    CGImageSourceRef imageSource = CGImageSourceCreateWithURL(url, NULL);
    
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, NULL);
    
    NSString *imageWidth = (NSString *) CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelWidth);
    
    NSString *imageHeight = (NSString *) CFDictionaryGetValue(imageProperties, kCGImagePropertyPixelHeight);
    
    NSLog(@"Image width: %@, Image Height: %@", imageWidth, imageHeight);
}

- (void)showImage
{
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"IMG_4079.JPG" withExtension:nil];
    
    CGImageSourceRef myImageSource = CGImageSourceCreateWithURL((__bridge CFURLRef) modelURL, NULL);
    
    CFDictionaryRef imageProperties = CGImageSourceCopyPropertiesAtIndex(myImageSource, 0, NULL);
    
    CGImageRef image = CGImageSourceCreateImageAtIndex(myImageSource, 0, NULL);
    [[self myImageView] setImage:[UIImage imageWithCGImage:image]];
    
    CFDictionaryRef tiff = CFDictionaryGetValue(imageProperties, kCGImagePropertyTIFFDictionary);
    CFDictionaryRef exif = CFDictionaryGetValue(imageProperties, kCGImagePropertyExifDictionary);
    
    NSString *model = CFDictionaryGetValue(tiff, kCGImagePropertyTIFFModel);
    NSString *make = CFDictionaryGetValue(tiff, kCGImagePropertyTIFFMake);
    NSString *focalLength = CFDictionaryGetValue(exif, kCGImagePropertyExifFocalLength);
    NSString *dateTime = CFDictionaryGetValue(exif, kCGImagePropertyExifDateTimeOriginal);
    NSString *aperture = CFDictionaryGetValue(exif, kCGImagePropertyExifApertureValue);
    NSString *shutterSpeed = CFDictionaryGetValue(exif, kCGImagePropertyExifShutterSpeedValue);
    NSString *exposureTime = CFDictionaryGetValue(exif, kCGImagePropertyExifExposureTime);
    
    [[self myImageInfo] setText:[NSString stringWithFormat:@"製造商：%@\n設備型號：%@\n焦距：%@\n拍攝時間：%@\n光圈：%@\n快門速度：%@\n曝光時間：%@", make, model, focalLength, dateTime, aperture, shutterSpeed, exposureTime]];
    
    [[self myImageInfo] setBackgroundColor:[UIColor redColor]];
    
    CFRelease(myImageSource);
    CFRelease(imageProperties);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    [self getImageFromWeb];
    [self showImage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
