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

@implementation LTScreenSaverView {
    LTScreenCaptureHelper *_screenCaptureHelper;
    NSImageView *_imageView;
}

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:qUpdateInterval];

        _screenCaptureHelper = [[LTScreenCaptureHelper alloc] init];

        _imageView = [[NSImageView alloc] initWithFrame:[self frame]];
        [self addSubview:_imageView];

        [self updateScreenshot];
    }

    return self;
}

- (void)updateScreenshot {
    if ([self isPreview]) {
        return;
    }

    [_imageView setImage:[_screenCaptureHelper screenAsImage]];
}

- (void)animateOneFrame {
    [super animateOneFrame];

    [self updateScreenshot];
}

- (void)dealloc {
    [_screenCaptureHelper release];
    [_imageView release];

    [super dealloc];
}

@end

