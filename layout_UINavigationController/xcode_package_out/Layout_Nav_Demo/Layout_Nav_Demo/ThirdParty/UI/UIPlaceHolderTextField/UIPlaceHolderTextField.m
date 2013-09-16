//
//  UIPlaceHolderTextField.m
//

#import "UIPlaceHolderTextField.h"

@implementation UIPlaceHolderTextField

@synthesize textLeftMargin = _textLeftMargin;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _textLeftMargin = 8.f;   // 默认左边距
    }
    return self;
}

#pragma mark - draw method

- (CGRect)textRectForBounds:(CGRect)bounds
{
    CGRect retRect = [super textRectForBounds:bounds];
    
    retRect.origin.x = _textLeftMargin;
    
    return retRect;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
    CGRect retRect = [super textRectForBounds:bounds];
    
    retRect.origin.x = _textLeftMargin;
        
    return retRect;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}

#pragma mark - setter

- (void)setTextLeftMargin:(CGFloat)aTextLeftMargin
{
    _textLeftMargin = aTextLeftMargin;
    [self setNeedsDisplay];
}

@end
