//
//  LTConfigureSheetWindowController.h
//  LookThrough
//
//  Created by Saagar Jha on 2/28/17.
//  Copyright © 2017 Tae Won Ha. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <ScreenSaver/ScreenSaver.h>

@class LTScreenSaverView;

@interface LTConfigureSheetWindowController : NSWindowController {
  NSTimeInterval updateInterval;
}

@property (assign) LTScreenSaverView *screenSaverView;
@property (assign) IBOutlet NSTextField *updateTimeIntervalLabel;
@property (assign) IBOutlet NSSlider *timeIntervalSlider;
@property (assign) IBOutlet NSButton *fadeCheckbox;

@end
