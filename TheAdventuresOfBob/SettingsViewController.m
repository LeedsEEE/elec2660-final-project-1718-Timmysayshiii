//
//  SettingsViewController.m
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "SettingsViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "MenuViewController.h"
#import "ViewController.h"
#import "InstructionsViewController.h"
#import "DataShared.h"

@interface SettingsViewController ()
{
    AVAudioPlayer *MenuMusic;
}
@end

@implementation SettingsViewController

@synthesize setName;

- (void)viewDidLoad {
    DataShared *data = [DataShared sharedInstance];
    
    NSString *stringKey = [[NSUserDefaults standardUserDefaults] stringForKey:@"ourTextKey"];
    self.recentGamePlayerName = stringKey;
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/melodyloops-adrenaline.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    MenuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    if ([self.musicStatetoPass isEqualToString:@"On"]) {
        NSLog(@"Music in settings is On");
        [MenuMusic play];
    }
    else {
        NSLog(@"Music in settings is Off");
        [MenuMusic stop];
    }
    
    self.recentGamePlayerName = [[DataShared sharedInstance] userName];
    self.recentGamePlayerScore = [[DataShared sharedInstance] highscoreVal];
    NSLog(@"Recent Game Name = %@", self.recentGamePlayerName);
    NSLog(@"Recent game score = %d", self.recentGamePlayerScore);
    
    if (self.recentGamePlayerScore > self.highsoreGamePlayerScore) {
        self.highsoreGamePlayerScore = self.recentGamePlayerScore;
        self.highscoreGamePlayerName = self.recentGamePlayerName;
        NSLog(@"Highscore Game Name = %@", self.highscoreGamePlayerName);
        NSLog(@"Highscore Game Score = %d", self.highsoreGamePlayerScore);
            self.highScoreSetbyValue.text = [NSString stringWithFormat:@" %@ = %d", self.highscoreGamePlayerName ,self.highsoreGamePlayerScore];
    }

    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"backButton"]){
        MenuViewController *Controller = (MenuViewController *)segue.destinationViewController;
        Controller.placeholderSwitchState= self.musicStatetoPass;
        NSLog(@"Music state menu = %@",self.musicStatetoPass);
        NSLog(@"Music state sent menu = %@",Controller.placeholderSwitchState);
    }
    
   if ([segue.identifier isEqualToString:@"PlayerNamePassOver"]){
        ViewController *Controller2 = (ViewController *)segue.destinationViewController;
        Controller2.placeholderSwitchState2= _musicStatetoPass;
       self.emptyName = self.setName;
       NSLog(@"%@",self.emptyName);
        Controller2.playerName= self.emptyName;
       NSLog(@"Name set in game = %@", Controller2.playerName);
    }
    
   if ([segue.identifier isEqualToString:@"PassOverSettings"]){
        InstructionsViewController *Controller4 = (InstructionsViewController *)segue.destinationViewController;
        Controller4.placeholderSwitchState4= _musicStatetoPass;
       NSLog(@"Music state passed to instructions = %@", self.musicStatetoPass);
    }
    
  // else if ([segue.identifier isEqualToString:@"PlayerNamePassOver"]){
       // ViewController *Controller5 = (ViewController *)segue.destinationViewController;
        //Controller5.playerName= self.setName;
   // }
}*/

- (IBAction)saveName:(UIButton *)sender {
    self.setName = self.enterName.text;
            [[DataShared sharedInstance] setUserName: setName];
    NSLog(@"Name set button pressed = %@", self.setName);
    NSLog(@"Shared name set = %@", [[DataShared sharedInstance] userName]);
}

- (IBAction)RemoveKeyboard:(UIControl *)sender {
    // Allows keyboard to be removed after we click background. UIView is changed to UIControl. Create IBAction and set event to touchupinside.
    
    NSLog(@"Background Pressed");
    if ([self.enterName isFirstResponder]) {
        [self.enterName resignFirstResponder];
    }
}

- (IBAction)BackButtonPressed:(UIButton *)sender {
     [MenuMusic stop];
}


#pragma mark Text Field Delegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if ([self.enterName isFirstResponder]) {
        [self.enterName resignFirstResponder];
    }
    
    return YES;
    // Removes keyboard from view when we press return
}

- (IBAction)musicState:(UISwitch *)sender {
    if (sender.on) {
        [MenuMusic play];
        /*self.musicState.text = [NSString stringWithFormat:@"Music State: On"];
        self.musicStatetoPass = [NSString stringWithFormat:@"On"];
        NSLog(@"Music state button is %@", self.musicStatetoPass);*/
        [[DataShared sharedInstance] setStateOfMusic:@"On"];
        NSLog(@"State of button = %@", [[DataShared sharedInstance] StateOfMusic]);
    }
    
    else {
        [MenuMusic stop];
        /*self.musicState.text = [NSString stringWithFormat:@"Music State: Off"];
        self.musicStatetoPass = [NSString stringWithFormat:@"Off"];
        NSLog(@"Music state button is %@", self.musicStatetoPass);*/
                [[DataShared sharedInstance] setStateOfMusic:@"Off"];
                NSLog(@"State of button = %@", [[DataShared sharedInstance] StateOfMusic]);
    }
}
@end
