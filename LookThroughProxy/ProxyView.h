/**
* Tae Won Ha — @hataewon
*
* http://taewon.de
* http://qvacua.com
*
* See LICENSE
*/

#import <Cocoa/Cocoa.h>


@interface ProxyView : NSView

- (IBAction)updateScreenshot:(id)sender;
- (void)drawRect:(NSRect)dirtyRect;

@end
