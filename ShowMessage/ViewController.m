//
//  ViewController.m
//  ShowMessage
//
//  Created by Po Hsun Lai on 3/11/13.
//  Copyright (c) 2013 Play Up. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/CALayer.h>


@interface ViewController ()

@end

@implementation ViewController

@synthesize textLabel,floatingMessageView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Call showMessage method
    [self showMessage:@"Hello World" completion:nil];
	
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) showMessage: (NSString *) message
          completion: (void (^) (void)) completion;
{
    // add text padding
    CGFloat padding=20.0f;
    [textLabel setFrame:CGRectMake(padding, padding, floatingMessageView.frame.size.width-2*padding, floatingMessageView.frame.size.height-2*padding)];
    
    // set text alignment and color, it's done in xib file as well
    [textLabel setTextAlignment:UITextAlignmentCenter];
    [textLabel setTextColor:[UIColor whiteColor]];
    
    // set textLable text
    [textLabel setText:message];    
    textLabel.adjustsFontSizeToFitWidth=YES;
    
    // set minimum font size, Minimum Font Size deprecated on ios version 6.0
    textLabel.minimumFontSize=12;    

    // initial floatingMessageView
    [floatingMessageView setAlpha:0.0f];
    [floatingMessageView setBackgroundColor:[UIColor blackColor]];
    [floatingMessageView setUserInteractionEnabled:NO];
    [[floatingMessageView layer]setCornerRadius:6.0f];    

    // add textLabel view to floatingMessageView
    [floatingMessageView addSubview:textLabel];
    [floatingMessageView sizeToFit];

    // add floatingMessageView to view
    [[self view]addSubview:floatingMessageView]; 
    
    // here call the animation and delay 3 sec to fade out
    [UIView animateWithDuration:0.5f delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{        
        [floatingMessageView setAlpha:1.0f];        
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.5f delay:3.0 options:UIViewAnimationCurveEaseOut animations:^{
            [floatingMessageView setAlpha:0.0f];
        } completion:^(BOOL finished){
            [floatingMessageView removeFromSuperview];
        }];        
    }];    

    
}

@end
