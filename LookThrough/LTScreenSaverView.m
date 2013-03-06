/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import "LTScreenSaverView.h"
#import "LTScreenCaptureHelper.h"

@implementation LTScreenSaverView {
    LTScreenCaptureHelper *_screenCaptureHelper;
}

+ (BOOL)performGammaFade {
    return NO;
}

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:-1];
        _screenCaptureHelper = [[LTScreenCaptureHelper alloc] init];
    }

    return self;
}

- (void)drawRect:(NSRect)rect {
    if (![self isPreview]) {
        [_screenCaptureHelper screenAsImage];
    }
}

@end

