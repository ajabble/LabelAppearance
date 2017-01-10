//
//  AJLabel.m
//  Pods
//
//  Created by Ashish Jabble on 10/01/17.
//
//

#import "AJLabel.h"
#import <objc/runtime.h>

@interface AJLabelAttribute : NSObject
@property (copy) UIColor *shadowColor;
@property (assign) CGSize shadowOffset;
@property (assign) float shadowOpacity;
@property (assign) float shadowRadius;
@property (assign) float cornerRadius;
@property (copy) UIColor *borderColor;
@property (assign) float borderWidth;
@property (retain) NSString *title;
@property (copy) UIColor *titleColor;
@end

@implementation AJLabelAttribute
@end


@interface AJLabel ()
@property (nonatomic,strong) NSMutableDictionary *shadowAttributesDictionary;
@end

@implementation AJLabel

#pragma mark methods

/**
 * Shadow color
 * @param { color:UIColor, offset:CGSize, opacity:float, radius:float, state:UIControlState }
 *
 */

- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius forState:(UIControlState)state {
    AJLabelAttribute *shadow = [self shadowAttributeForState:state];
    shadow.shadowColor = color;
    shadow.shadowOffset = size;
    shadow.shadowOpacity = opacity;
    shadow.shadowRadius = radius;
    
    if (state == UIControlStateNormal)
        [self setLabelAttribute:shadow];
    
    [self setShadowAttributes:shadow forState:state];
}

/**
 * Corner Radius
 * @param { radius:float, borderWidth:float, borderColor:UIColor, state:UIControlState }
 *
 */

- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color forState:(UIControlState)state {
    AJLabelAttribute *shadow = [self shadowAttributeForState:state];
    shadow.cornerRadius = radius;
    shadow.borderColor = color;
    shadow.borderWidth = width;
    
    if (state == UIControlStateNormal)
        [self setLabelAttribute:shadow];
    
    [self setShadowAttributes:shadow forState:state];
}

/**
 * Set Label Attributes
 * @param { :attributes }
 *
 */

- (void)setLabelAttribute:(AJLabelAttribute *)attribute {
    self.layer.shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:attribute.cornerRadius].CGPath;
    self.layer.shadowColor = attribute.shadowColor.CGColor;
    self.layer.shadowOffset = attribute.shadowOffset;
    self.layer.shadowOpacity = attribute.shadowOpacity;
    self.layer.shadowRadius = attribute.shadowRadius;
    
    self.layer.cornerRadius = attribute.cornerRadius;
    self.layer.borderColor = attribute.borderColor.CGColor;
    self.layer.borderWidth = attribute.borderWidth;
}

/**
 * Set Shadow Attributes
 * @param { :attributes }
 *
 */

- (void)setShadowAttributes:(AJLabelAttribute *)attribute forState:(UIControlState)state {
    if (!attribute)
    return;
    
    if (state == UIControlStateNormal)
        [self.shadowAttributesDictionary setObject:attribute forKey:@(UIControlStateNormal)];
    
    if (state & UIControlStateHighlighted)
        [self.shadowAttributesDictionary setObject:attribute forKey:@(UIControlStateHighlighted)];
    
    if (state & UIControlStateSelected)
        [self.shadowAttributesDictionary setObject:attribute forKey:@(UIControlStateSelected)];
    
    if (state & UIControlStateFocused)
        [self.shadowAttributesDictionary setObject:attribute forKey:@(UIControlStateFocused)];
    
}

- (AJLabelAttribute *)shadowAttributeForState:(UIControlState)state {
    AJLabelAttribute *attribute = [self.shadowAttributesDictionary objectForKey:@(state)];
    if (!attribute)
        attribute = [[AJLabelAttribute alloc] init];
    
    return attribute;
}

- (NSMutableDictionary *)shadowAttributesDictionary {
    if (!_shadowAttributesDictionary)
        _shadowAttributesDictionary = [NSMutableDictionary dictionary];
    
    return _shadowAttributesDictionary;
}

@end
