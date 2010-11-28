//
//  HypnosisView.m
//  Hypnosister
//
//  Created by Steve Baker on 11/27/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "HypnosisView.h"


@implementation HypnosisView


- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code.
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // What rectangle am I filling?
    CGRect bounds = [self bounds];
    
    // Where is its center?
    CGPoint center;
    center.x = bounds.origin.x + (bounds.size.width / 2.0);
    center.y = bounds.origin.y + (bounds.size.height / 2.0);
    
    // From the center how far out to a corner?
    float maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    // Get the context being drawn in
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // All lines will be drawn 10 points wide
    CGContextSetLineWidth(context, 10.0);
    
    // Set the stroke color to light gray
    [[UIColor lightGrayColor] setStroke];
    
    // Draw concentric circles from the outside in
    for (float currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) 
    {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, 2.0 * M_PI, YES);
        CGContextStrokePath(context);
    }
}


- (void)dealloc {
    [super dealloc];
}


@end
