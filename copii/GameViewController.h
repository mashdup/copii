//
//  GameViewController.h
//  copii
//
//  Created by Dillon on 22/10/2013.
//  Copyright (c) 2013 8BitDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController {
    IBOutlet UIButton *topButton;
    IBOutlet UIButton *rightButton;
    IBOutlet UIButton *bottomButton;
    IBOutlet UIButton *leftButton;
}

- (IBAction)userDidPressedButton:(id)sender;

@end
