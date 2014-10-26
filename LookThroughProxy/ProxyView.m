/**
* Tae Won Ha — @hataewon
*
* http://taewon.de
* http://qvacua.com
*
* See LICENSE
*/

#import "ProxyView.h"
#import "LTScreenCaptureHelper.h"


@implementation ProxyView {
  LTScreenCaptureHelper *_helper;
  NSImage *_image;
}

- (IBAction)updateScreenshot:(id)sender {
  _image = [LTScreenCaptureHelper defaultHelper].screenAsImage;

  self.needsDisplay = YES;

#ifdef DEBUG
  [_image.TIFFRepresentation writeToFile:@"/tmp/shot.tiff" atomically:NO];
#endif
}

- (void)drawRect:(NSRect)dirtyRect {
//  [_image drawAtPoint:dirtyRect.origin fromRect:screenRect operation:NSCompositeSourceOver fraction:1];
  [_image drawInRect:self.frame fromRect:NSZeroRect operation:NSCompositeSourceOver fraction:1];
}

@end
