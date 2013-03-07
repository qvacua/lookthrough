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

    NSImage *_image;
}

- (id)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview {
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:qUpdateInterval];
        _screenCaptureHelper = [[LTScreenCaptureHelper alloc] init];
        _imageView = [[NSImageView alloc] initWithFrame:[self frame]];
        [self addSubview:_imageView];

        if (![self isPreview]) {
            _image = [[_screenCaptureHelper screenAsImage] retain];
            [_imageView setImage:_image];
        }
    }

    return self;
}

- (void)animateOneFrame {
    [super animateOneFrame];

    if (![self isPreview]) {
        [_image release];
        _image = [[_screenCaptureHelper screenAsImage] retain];
        [self setNeedsDisplay:YES];
    }
}

- (void)drawRect:(NSRect)rect {
    [super drawRect:rect];

    if (![self isPreview]) {
        NSLog(@"%@", _image);
        [_imageView setImage:_image];
        NSBitmapImageRep *imgRep = [[_image representations] objectAtIndex: 0];
        NSData *data = [imgRep representationUsingType: NSPNGFileType properties: nil];
        [data writeToFile:[NSString stringWithFormat:@"/tmp/test-%@", [NSDate date]] atomically: NO];
    }
}

- (void)dealloc {
    [_screenCaptureHelper release];
    [_imageView release];
    [_image release];

    [super dealloc];
}

@end

