//
//  MWInbilinCaptionView.m
//  Pods
//
//  Created by 柬斐 王 on 15/9/28.
//
//

#import "MWInbilinCaptionView.h"
#import "MWCommon.h"

static const CGFloat horizontalPadding = 12;
static const CGFloat verticalPadding = 10;
static const CGFloat maxHeight = 110;

@interface MWInbilinCaptionView () {
    id <MWPhoto> _photo;
    UITextView *_textView;
}

@end

@implementation MWInbilinCaptionView

// Init
- (id)initWithPhoto:(id<MWPhoto>)photo {
    self = [super initWithFrame:CGRectMake(0, 0, 320, 44)]; // Random initial frame
    if (self) {
        self.userInteractionEnabled = YES;
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        
        _photo = photo;
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin;
        [self setupCaption];
    }
    return self;
}

- (void)setupCaption {
    UIFont *font = [UIFont systemFontOfSize:14];
    _textView = [[UITextView alloc] initWithFrame:self.bounds];
    _textView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    _textView.backgroundColor = [UIColor clearColor];
    _textView.font = font;
    _textView.textColor = [UIColor whiteColor];
    _textView.showsVerticalScrollIndicator = NO;
    _textView.showsHorizontalScrollIndicator = NO;
    _textView.editable = NO;
    _textView.contentInset = UIEdgeInsetsMake(verticalPadding, horizontalPadding, verticalPadding, horizontalPadding);
    if ([_photo respondsToSelector:@selector(caption)]) {
        _textView.text = [_photo caption] ? [_photo caption] : @" ";
    }
    [self addSubview:_textView];
    
    
    CGSize textSize = [_textView.text boundingRectWithSize:CGSizeMake(self.bounds.size.width-horizontalPadding*2, maxHeight)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName: font}
                                                   context:nil].size;
    if (textSize.height > 25) {
        _textView.textAlignment = NSTextAlignmentLeft;
    } else {
        _textView.textAlignment = NSTextAlignmentCenter;
    }
    if (_textView.text == nil ||
        _textView.text.length == 0) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
}

// Override -sizeThatFits: and return a CGSize specifying the height of your
// custom caption view. With width property is ignored and the caption is displayed
// the full width of the screen
- (CGSize)sizeThatFits:(CGSize)size {
    CGSize textSize = [_textView.text boundingRectWithSize:CGSizeMake(self.bounds.size.width-horizontalPadding*2, maxHeight - verticalPadding*2)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName: _textView.font}
                                                   context:nil].size;
    return CGSizeMake(size.width, textSize.height + verticalPadding * 2);
}

@end