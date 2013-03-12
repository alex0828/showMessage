//
//  ViewController.h
//  ShowMessage
//
//  Created by Po Hsun Lai on 3/11/13.
//  Copyright (c) 2013 Play Up. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    UILabel *textLabel;
    UIView *floatingMessageView;    
}

@property (nonatomic, retain) IBOutlet UILabel *textLabel;
@property (nonatomic, retain) IBOutlet UIView *floatingMessageView;


- (void) showMessage: (NSString *) message
          completion: (void (^) (void)) completion;
@end
