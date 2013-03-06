/**
 * Tae Won Ha
 * http://qvacua.com
 * https://github.com/qvacua
 *
 * See LICENSE
 */

#import "LookThroughView.h"

@implementation LookThroughView

+ (BOOL)performGammaFade {
    return NO;
}

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:-1];
    }

    return self;
}

- (void)drawRect:(NSRect)rect {
    if (![self isPreview]) {
        NSWindow *window = [self window];

        [window setBackgroundColor:[NSColor clearColor]];
        [window setAlphaValue:0];
    }
}

@end
