//
//  GameViewController.m
//  copii
//
//  Created by Dillon on 22/10/2013.
//  Copyright (c) 2013 8BitDog. All rights reserved.
//

#import "GameViewController.h"
#import <AVFoundation/AVFoundation.h>

#define AUDIO_ARRAY @[@"A3-220.0",@"B4-493.88",@"D4-293.66",@"G4-392.0"]

@interface GameViewController ()
@property (nonatomic, copy) NSMutableArray *answerArray;
@property (nonatomic, retain) NSMutableArray *referenceArray;
@property (nonatomic, retain) NSArray *buttonArray;
@property (nonatomic) NSInteger amountToAdd;
@property (nonatomic) NSInteger level;
@property (nonatomic) AVAudioPlayer *avSound;

@end

@implementation GameViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _buttonArray = @[topButton,rightButton,bottomButton,leftButton];
    _answerArray = [[NSMutableArray alloc] init];
    _referenceArray = [[NSMutableArray alloc] init];
    _amountToAdd = 4;
    _level = 4;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self addNewAnswer];
}

#pragma mark - Game sounds

- (void)playSound :(NSString *)fName{
    NSString *path = [[NSBundle mainBundle] pathForResource : fName ofType :@"mp3"];
    if ([[NSFileManager defaultManager] fileExistsAtPath : path]) {
        NSURL *pathURL = [NSURL fileURLWithPath: path];
        _avSound = [[AVAudioPlayer alloc]
                   initWithContentsOfURL:pathURL error:nil];
        [_avSound setCurrentTime:59.1];
        [_avSound play];
        
    }
}

#pragma mark - Game Set Up Methods

- (void)addNewAnswer {
    if (_amountToAdd >0){
        UIButton *selectedButton = [_buttonArray objectAtIndex:(arc4random() % 3)];
        [_referenceArray addObject:selectedButton];
        _amountToAdd--;
        [self addNewAnswer];
    } else {
        _answerArray = [_referenceArray mutableCopy];
        [self animateQuestionFromIndex:0];
    }
    
}

- (void)animateQuestionFromIndex:(NSInteger)index {
    if (index < [_referenceArray count ]){
        UIButton *selectedButton =[_referenceArray objectAtIndex:index];
        [self playSound:[AUDIO_ARRAY objectAtIndex:[_buttonArray indexOfObject:selectedButton]]];
        [UIView animateWithDuration:.5 delay:.0 options:UIViewAnimationOptionAutoreverse animations:^{
            selectedButton.backgroundColor = [UIColor grayColor];
        } completion:^(BOOL finished) {
            if (finished){
                selectedButton.backgroundColor = [UIColor clearColor];
                [self animateQuestionFromIndex:index+1];
                
            }
        }];
    
    }
}

#pragma mark - Game Logic Methods

- (IBAction)userDidPressedButton:(id)sender {
    [self playSound:[AUDIO_ARRAY objectAtIndex:[_buttonArray indexOfObject:sender]]];
    
    if ([sender isEqual:[_answerArray firstObject]]){
        NSLog(@"correct!");
        [_answerArray removeObjectAtIndex:0];
    }else {
        NSLog(@"FAIL");
    }
    if ([_answerArray count] == 0){
        _amountToAdd =1;
        NSLog(@"Done!");
        [self addNewAnswer];
    }
}

@end
