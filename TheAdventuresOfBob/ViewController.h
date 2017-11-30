//
//  ViewController.h
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 13/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *RoadmanShaq;
@property (weak, nonatomic) IBOutlet UILabel *Score;
@property (weak, nonatomic) IBOutlet UIProgressView *HealthBar;
@property (weak, nonatomic) IBOutlet UIButton *AttackbuttonX;
@property (weak, nonatomic) IBOutlet UIButton *StartGameX;
@property (weak, nonatomic) IBOutlet UILabel *Healthlabel;
@property (weak, nonatomic) IBOutlet UIImageView *BorgBunnySprite;
@property (weak, nonatomic) IBOutlet UIImageView *Fireball;
@property (weak, nonatomic) IBOutlet UIImageView *FistAttack;
@property (weak, nonatomic) IBOutlet UIButton *Settingsbutton;
@property (weak, nonatomic) IBOutlet UIButton *instructionsbutton;
@property (weak, nonatomic) IBOutlet UIButton *startgamebutton;
@property (weak, nonatomic) IBOutlet UIImageView *egg1;
@property (weak, nonatomic) IBOutlet UIImageView *egg2;
@property (weak, nonatomic) IBOutlet UIImageView *egg3;
@property (weak, nonatomic) IBOutlet UIImageView *egg4;

@property (strong ,nonatomic) UITouch *touch;
@property (strong, nonatomic) NSTimer *fireballMovementTimer;
@property (strong, nonatomic) NSTimer *fistattackMovementTimer;
@property (strong, nonatomic) NSTimer *bunnyMovementTimer;
@property (strong, nonatomic) NSTimer *eggMovementTimer;

- (IBAction)StartGame:(UIButton *)sender;
- (IBAction)AttackButton:(UIButton *)sender;

-(void)fistattackMovement;
-(void)bunnyPosition;
-(void)bunnyMovementTimerx;
-(void)bunnyMovement;
-(void)eggMovement;
-(void)GameOver;
-(void)ReplayGame;
@end

