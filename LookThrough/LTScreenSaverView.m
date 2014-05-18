/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import "LTScreenSaverView.h"
#import "LTScreenCaptureHelper.h"


static NSTimeInterval const qUpdateInterval = 5;


@implementation LTScreenSaverView

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
  self = [super initWithFrame:frame isPreview:isPreview];
  if (!self) {
    return nil;
  }

  self.animationTimeInterval = qUpdateInterval;

  return self;
}

- (void)drawRect:(NSRect)dirtyRect {
  NSImage *image = [LTScreenCaptureHelper defaultHelper].screenAsImage;
  NSRect screenRect = self.window.screen.frame;

  [image drawAtPoint:dirtyRect.origin fromRect:screenRect operation:NSCompositeSourceOver fraction:1];
}

- (void)animateOneFrame {
  self.needsDisplay = YES;
}

- (void)dealloc {
  [super dealloc];
}

@end

