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



- (IBAction)StartGame:(UIButton *)sender;
- (IBAction)AttackButton:(UIButton *)sender;

@end

