/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import "LTScreenSaverView.h"
#import "LTScreenCaptureHelper.h"
#import "LTConfigureSheetWindowController.h"

NSTimeInterval qUpdateInterval = 5;

@implementation LTScreenSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
  self = [super initWithFrame:frame isPreview:isPreview];
  if (!self) {
    return nil;
  }
  
  [self updateAnimationInterval];
  
  return self;
}

- (void)updateAnimationInterval {
  NSNumber *updateInterval = [[ScreenSaverDefaults defaultsForModuleWithName:[[NSBundle bundleForClass: self.class] bundleIdentifier]] objectForKey:@"updateInterval"];
  if (updateInterval) {
    qUpdateInterval = [updateInterval doubleValue];
  } else {
    qUpdateInterval = 5;
  }
  self.animationTimeInterval = qUpdateInterval;
}

+ (BOOL)performGammaFade {
  return [[ScreenSaverDefaults defaultsForModuleWithName:[[NSBundle bundleForClass: self.class] bundleIdentifier]] boolForKey:@"fade"];
}

- (BOOL)isOpaque {
  return YES;
}

- (BOOL)hasConfigureSheet {
  return YES;
}

- (NSWindow *)configureSheet {
  if (!configureSheetWindowController) {
    configureSheetWindowController = [[LTConfigureSheetWindowController alloc] initWithWindowNibName:@"ConfigureSheet"];
    configureSheetWindowController.screenSaverView = self;
  }
  return configureSheetWindowController.window;
}

- (void)drawRect:(NSRect)dirtyRect {
  NSImage *image = [LTScreenCaptureHelper defaultHelper].screenAsImage;
  NSRect screenRect = self.frame;
  
  [image drawInRect:screenRect fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
}

- (void)animateOneFrame {
  self.needsDisplay = YES;
}

- (void)dealloc {
  [super dealloc];
}

@end

