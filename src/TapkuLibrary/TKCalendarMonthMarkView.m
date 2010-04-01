//
//  TKCalendarMonthMarkView.m
//  TapkuLibrary
//
//  Created by Ryan Petrich on 10-04-01.
//  Copyright 2010 Ryan Petrich. All rights reserved.
//

#import "TKCalendarMonthMarkView.h"

static UIColor *defaultMarkColor;
static UIColor *defaultSelectedMarkColor;

@implementation TKCalendarMonthMarkView

@synthesize selected = _selected, color = _color, selectedColor = _selectedColor;

+ (void)initialize
{
	defaultMarkColor = [[UIColor alloc] initWithRed:75.0f/255.0f green:92.0f/255.0f blue:111.0f/255.0f alpha:1.0f];
	defaultSelectedMarkColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1.0f];
}

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame])) {
		[self setBackgroundColor:[UIColor clearColor]];
		[self setOpaque:NO];
		_color = [defaultMarkColor retain];
		_selectedColor = [defaultSelectedMarkColor retain];
	}
	return self;
}

- (void)dealloc
{
	[_color release];
	[_selectedColor release];
	[super dealloc];
}

- (void)setSelected:(BOOL)selected
{
	_selected = selected;
	[self setNeedsDisplay];
}

- (void)setColor:(UIColor *)color
{
	if (_color != color) {
		[_color release];
		_color = [color retain];
		if (!_selected)
			[self setNeedsDisplay];
	}
}

- (void)setSelectedColor:(UIColor *)selectedColor
{
	if (_selectedColor != selectedColor) {
		[_selectedColor release];
		_selectedColor = [selectedColor retain];
		if (_selected)
			[self setNeedsDisplay];
	}
}

- (void)drawRect:(CGRect)rect
{
	if(_selected)
		[_selectedColor setFill];
	else
		[_color setFill];
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(context, 0.0);
	CGContextAddEllipseInRect(context, CGRectMake(self.frame.size.width/2 - 2, 45 - 10, 4, 4));
	CGContextFillPath(context);
}

@end
