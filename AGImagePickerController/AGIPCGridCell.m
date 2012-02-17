//
//  AGIPCGridCell.m
//  AGImagePickerController
//
//  Created by Artur Grigor on 17.02.2012.
//  Copyright (c) 2012 Artur Grigor. All rights reserved.
//

#import "AGIPCGridCell.h"
#import "AGIPCGridItem.h"
#import "AGImagePickerController.h"

@implementation AGGridCell

#pragma mark - Properties

@synthesize items;

- (void)setItems:(NSArray *)theItems
{
    if (items != theItems)
    {
        for (UIView *view in [self subviews]) 
        {		
            [view removeFromSuperview];
        }
        
        [items release];
        items = [theItems retain];
    }
}

#pragma mark - Object Lifecycle

- (void)dealloc
{
    [items release];
    
    [super dealloc];
}

- (id)initWithItems:(NSArray *)theItems reuseIdentifier:(NSString *)theIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:theIdentifier];
    if(self)
    {    
		self.items = theItems;
        
        UIView *emptyView = [[UIView alloc] initWithFrame:CGRectZero];
        self.backgroundView = emptyView;
        [emptyView release];
	}
	
	return self;
}

#pragma mark - Layout

- (void)layoutSubviews
{    
    CGFloat leftMargin = ALBUM_LEFT_MARGIN;
	CGRect frame = CGRectMake(leftMargin, ALBUM_TOP_MARGIN, ALBUM_WIDTH, ALBUM_HEIGHT);
    
	for (AGGridItem *gridItem in self.items)
    {	
		[gridItem setFrame:frame];
        UITapGestureRecognizer *selectionGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:gridItem action:@selector(tap)];
        selectionGestureRecognizer.numberOfTapsRequired = 1;
		[gridItem addGestureRecognizer:selectionGestureRecognizer];
        [selectionGestureRecognizer release];
        
		[self addSubview:gridItem];
		
		frame.origin.x = frame.origin.x + frame.size.width + leftMargin;
	}
}

@end