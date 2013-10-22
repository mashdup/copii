//
//  GameViewController.h
//  copii
//
//  Created by Dillon on 22/10/2013.
//  Copyright (c) 2013 8BitDog. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameViewController : UIViewController <UIAlertViewDelegate>{
    IBOutlet UIButton *topButton;
    IBOutlet UIButton *rightButton;
    IBOutlet UIButton *bottomButton;
    IBOutlet UIButton *leftButton;
    IBOutlet UILabel *levelCounter;
}

- (IBAction)userDidPressedButton:(id)sender;

@end
