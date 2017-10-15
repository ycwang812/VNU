//
//  ViewController.h
//  ImageIOSample02
//
//  Created by CSIEVNUT403 on 2014/5/22.
//  Copyright (c) 2014年 CSIEVNUT403. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ImageIO/ImageIO.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UIImageView *myThumbnaiView;

- (void)showImages;

@end
