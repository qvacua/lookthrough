//
//  LTConfigureSheetWindowController.m
//  LookThrough
//
//  Created by Saagar Jha on 2/28/17.
//  Copyright © 2017 Tae Won Ha. All rights reserved.
//

#import "LTConfigureSheetWindowController.h"
#import "LTScreenSaverView.h"

@implementation LTConfigureSheetWindowController

static const NSTimeInterval timeForTickMark[] =  { 1,       // 1 second
                                                   2,       // 2 seconds
                                                   5,       // 5 seconds
                                                   10,      // 10 seconds
                                                   15,      // 15 seconds
                                                   30,      // 30 seconds
                                                   60,      // 1 minute
                                                   600,     // 10 minutes
                                                   1800,    // 30 minutes
                                                   3600,    // 1 hour
                                                   DBL_MAX, // Never
                                                 };

static const int maxTickMark = sizeof(timeForTickMark) / sizeof(*timeForTickMark) - 1;
static const double snapDistance = 0.2;

- (void)windowDidLoad {
  [super windowDidLoad];
  
  // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
  ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:[[NSBundle bundleForClass: self.class] bundleIdentifier]];
  NSNumber *ui = [defaults objectForKey:@"updateInterval"];
  updateInterval = ui ? [ui doubleValue] : 5;
  [self updateTimeIntervalSlider];
  [self updateUpdateTimeIntervalLabel];
  self.fadeCheckbox.state = [defaults boolForKey:@"fade"] ? NSOnState : NSOffState;
}

- (IBAction)sliderValueChanged:(NSSlider *)sender {
  updateInterval = [self updateTimeIntervalForSlider:sender];
  [self updateUpdateTimeIntervalLabel];
}

- (IBAction)cancel:(NSButton *)sender {
  [NSApp endSheet:self.window];
}

- (IBAction)ok:(NSButton *)sender {
  ScreenSaverDefaults *defaults = [ScreenSaverDefaults defaultsForModuleWithName:[[NSBundle bundleForClass: self.class] bundleIdentifier]];
  [defaults setDouble:updateInterval forKey:@"updateInterval"];
  [defaults setBool:(self.fadeCheckbox.state == NSOnState) forKey:@"fade"];
  [defaults synchronize];
  [self.screenSaverView updateAnimationInterval];
  [NSApp endSheet:self.window];
}

- (NSTimeInterval)updateTimeIntervalForSlider:(NSSlider *)slider {
  double iPart;
  double fPart = modf(slider.doubleValue, &iPart);
  if (slider.doubleValue > maxTickMark - 1) { // Snap to "Never"
    iPart = maxTickMark + 1;
    fPart = 0;
  }
  // Snap to tick marks…
  if (fPart < snapDistance) { // …from below
    slider.doubleValue = iPart;
    fPart = 0;
  } else if (fPart > 1 - snapDistance) { // …from above
    slider.doubleValue = ++iPart;
    fPart = 0;
  }
  int tickMark = (int)iPart;
  if (tickMark > maxTickMark) { // Bail out for "Never"
    return timeForTickMark[maxTickMark];
  }
  NSTimeInterval bottom = timeForTickMark[tickMark++];
  NSTimeInterval top = timeForTickMark[tickMark];
  return bottom + (top - bottom) * fPart;
}

- (void)updateTimeIntervalSlider {
  int tickMark;
  for (tickMark = 0; tickMark < maxTickMark - 1 && timeForTickMark[tickMark] < updateInterval; ++tickMark);
  NSTimeInterval bottom = timeForTickMark[tickMark];
  NSTimeInterval top = timeForTickMark[tickMark + 1];
  self.timeIntervalSlider.doubleValue = tickMark + (updateInterval - bottom) / (top - bottom);
}

- (void)updateUpdateTimeIntervalLabel {
  double value = updateInterval;
  NSString *unit;
  if (0 < updateInterval && updateInterval < 60) { // seconds
    unit = @"s";
  } else if (60 <= updateInterval && updateInterval < 3600) { // minutes
    value /= 60;
    unit = @"min";
  } else if (3600 <= updateInterval && updateInterval < 86400) { // hours
    value /= 3600;
    unit = @"hr";
  } else { // "Never"
    self.updateTimeIntervalLabel.stringValue = @"Never";
    return;
  }
  self.updateTimeIntervalLabel.stringValue = [NSString stringWithFormat:@"%.0f %@", value, unit];
}

@end
