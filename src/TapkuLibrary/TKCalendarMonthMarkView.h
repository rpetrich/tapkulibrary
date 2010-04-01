//
//  TKCalendarMonthMarkView.h
//  TapkuLibrary
//
//  Created by Ryan Petrich on 10-04-01.
//  Copyright 2010 Ryan Petrich. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TKCalendarMonthMarkView : UIView {
@private
	BOOL _selected;
	UIColor *_color;
	UIColor *_selectedColor;
}

@property (nonatomic, assign) BOOL selected;
@property (nonatomic, retain) UIColor *color;
@property (nonatomic, retain) UIColor *selectedColor;

@end
