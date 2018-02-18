/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import <ScreenSaver/ScreenSaver.h>

@class LTConfigureSheetWindowController;

@interface LTScreenSaverView : ScreenSaverView {
  LTConfigureSheetWindowController *configureSheetWindowController;
}
- (void)updateAnimationInterval;
@end
