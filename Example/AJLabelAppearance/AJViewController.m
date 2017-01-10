//
//  AJViewController.m
//  AJLabelAppearance
//
//  Created by ajabble on 01/10/2017.
//  Copyright (c) 2017 ajabble. All rights reserved.
//

#import "AJViewController.h"
#import <AJLabelAppearance/AJLabel.h>

@interface AJViewController ()
@property (strong, nonatomic) IBOutlet AJLabel *label1;
@property (strong, nonatomic) IBOutlet AJLabel *label2;
@property (strong, nonatomic) IBOutlet AJLabel *label3;
@end

@implementation AJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Usage of AJLabel
    [_label1 setShadowColor:[UIColor blueColor] offset:CGSizeMake(0, 3.0) opacity:0.3 radius:3.0 forState:UIControlStateNormal];
    
    [_label2 setShadowColor:[UIColor colorWithRed:156/255.0 green:126/255.0 blue:66/255.0 alpha:1.0]  offset:CGSizeMake(0, 3.0) opacity:1.0 radius:1.0 forState:UIControlStateNormal];
    
    [_label3 setCornerRadius:10.0 borderWidth:1.0 borderColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_label3 setTextAlignment:NSTextAlignmentCenter];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
