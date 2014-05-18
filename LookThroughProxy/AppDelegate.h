//
//  AppDelegate.h
//  LookThroughProxy
//
//  Created by Tae Won Ha on 18/05/14.
//  Copyright (c) 2014 Tae Won Ha. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSImageView *imageView;

- (IBAction)updateScreenshot:(id)sender;

@end
