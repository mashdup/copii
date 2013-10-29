//
//  GameViewController.h
//  copii
//
//  Created by Dillon on 22/10/2013.
//  Copyright (c) 2013 8BitDog. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CopiiSpotButton.h"

@interface GameViewController : UIViewController <UIAlertViewDelegate>{
    IBOutlet CopiiSpotButton *topButton;
    IBOutlet CopiiSpotButton *rightButton;
    IBOutlet CopiiSpotButton *bottomButton;
    IBOutlet CopiiSpotButton *leftButton;
    IBOutlet UILabel *levelCounter;
}

- (IBAction)userDidPressedButton:(id)sender;

@end
