//
//  GameViewController.m
//  copii
//
//  Created by Dillon on 22/10/2013.
//  Copyright (c) 2013 8BitDog. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()
@property (nonatomic, copy) NSMutableArray *answerArray;
@property (nonatomic, retain) NSMutableArray *referenceArray;
@property (nonatomic, retain) NSArray *buttonArray;
@property (nonatomic) NSInteger amountToAdd;
@property (nonatomic) NSInteger level;

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
