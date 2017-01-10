//
//  AJLabel.h
//  Pods
//
//  Created by Ashish Jabble on 10/01/17.
//
//

#import <Foundation/Foundation.h>

@interface AJLabel : UILabel

- (void)setShadowColor:(UIColor *)color offset:(CGSize)size opacity:(float)opacity radius:(float)radius forState:(UIControlState)state;

- (void)setCornerRadius:(float)radius borderWidth:(float)width borderColor:(UIColor *)color forState:(UIControlState)state;

@end
