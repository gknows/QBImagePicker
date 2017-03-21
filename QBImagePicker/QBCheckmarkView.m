//
//  QBCheckmarkView.m
//  QBImagePicker
//
//  Created by Katsuma Tanaka on 2015/04/03.
//  Copyright (c) 2015 Katsuma Tanaka. All rights reserved.
//

#import "QBCheckmarkView.h"

@implementation QBCheckmarkView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    // Set default values
    self.borderWidth = 0.0;
    self.checkmarkLineWidth = 2.0;
    
    self.borderColor = [UIColor whiteColor];
    // #22A2A1
    self.bodyColor = [UIColor colorWithRed:(34.0 / 255.0) green:(162.0 / 255.0) blue:(161.0 / 255.0) alpha:1.0];
    self.checkmarkColor = [UIColor whiteColor];
    
    // Set shadow
    self.layer.shadowColor = [[UIColor grayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowOpacity = 0.6;
    self.layer.shadowRadius = 2.0;
}

- (void)drawRect:(CGRect)rect
{
    // Border
    [self.borderColor setFill];
    [[UIBezierPath bezierPathWithOvalInRect:self.bounds] fill];
    
    // Body
    [self.bodyColor setFill];
    [[UIBezierPath bezierPathWithOvalInRect:CGRectInset(self.bounds, self.borderWidth, self.borderWidth)] fill];
    
    // Checkmark
    UIBezierPath *checkmarkPath = [UIBezierPath bezierPath];
    checkmarkPath.lineWidth = self.checkmarkLineWidth;
    
    [checkmarkPath moveToPoint:CGPointMake(CGRectGetWidth(self.bounds) * (4.0 / 18.0), CGRectGetHeight(self.bounds) * (10.0 / 18.0))];
    [checkmarkPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) * (7.0 / 18.0), CGRectGetHeight(self.bounds) * (13.0 / 18.0))];
    [checkmarkPath addLineToPoint:CGPointMake(CGRectGetWidth(self.bounds) * (14.0 / 18.0), CGRectGetHeight(self.bounds) * (6.0 / 18.0))];
    
    [self.checkmarkColor setStroke];
    [checkmarkPath stroke];
}

@end
