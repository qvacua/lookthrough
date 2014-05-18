//
//  AppDelegate.m
//  LookThroughProxy
//
//  Created by Tae Won Ha on 18/05/14.
//  Copyright (c) 2014 Tae Won Ha. All rights reserved.
//

#import "AppDelegate.h"
#import "LTScreenCaptureHelper.h"


@implementation AppDelegate {
  LTScreenCaptureHelper *_helper;
}

- (IBAction)updateScreenshot:(id)sender {
  NSImage *image = [LTScreenCaptureHelper defaultHelper].screenAsImage;
  _imageView.image = image;
}

@end
