//
//  ViewController.h
//  ImageIOSample01
//
//  Created by CSIEVNUT403 on 2014/5/8.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UITextView *myImageInfo;

- (void)getImageFromWeb;
- (void)showImage;

@end
