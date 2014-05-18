/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import <Foundation/Foundation.h>


@interface LTScreenCaptureHelper : NSObject

- (NSImage *)screenAsImage;

+ (LTScreenCaptureHelper *)defaultHelper;

@end
