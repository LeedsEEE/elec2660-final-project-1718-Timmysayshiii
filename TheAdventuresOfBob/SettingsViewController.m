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


@interface SettingsViewController ()
{
    AVAudioPlayer *MenuMusic;
}
@end

@implementation SettingsViewController

@synthesize setName;

- (void)viewDidLoad {
    
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
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"musicStateSwitchVal"]){
        MenuViewController *Controller = (MenuViewController *)segue.destinationViewController;
        Controller.placeholderSwitchState= _musicStatetoPass;
        NSLog(@"The state being sent to menu is %@",self.musicStatetoPass);
    }
    
   else if ([segue.identifier isEqualToString:@"PlayerNamePassOver"]){
        ViewController *Controller2 = (ViewController *)segue.destinationViewController;
        Controller2.placeholderSwitchState2= _musicStatetoPass;
        Controller2.playerName= self.setName;
       NSLog(@"The name being set in game is %@", setName);
    }
    
   else if ([segue.identifier isEqualToString:@"PassOverSettings"]){
        InstructionsViewController *Controller4 = (InstructionsViewController *)segue.destinationViewController;
        Controller4.placeholderSwitchState4= _musicStatetoPass;
       NSLog(@"The music state being passed to instructions is %@", self.musicStatetoPass);
    }
    
  // else if ([segue.identifier isEqualToString:@"PlayerNamePassOver"]){
       // ViewController *Controller5 = (ViewController *)segue.destinationViewController;
        //Controller5.playerName= self.setName;
   // }
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

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    self.setName = self.enterName.text;
        NSLog(@"The name is now set as %@", self.setName);
    return YES;
}

- (IBAction)musicState:(UISwitch *)sender {
    if (sender.on) {
        [MenuMusic play];
        self.musicState.text = [NSString stringWithFormat:@"Music State: On"];
        self.musicStatetoPass = [NSString stringWithFormat:@"On"];
        NSLog(@"The music state is now %@", self.musicStatetoPass);
    }
    
    else {
        [MenuMusic stop];
        self.musicState.text = [NSString stringWithFormat:@"Music State: Off"];
        self.musicStatetoPass = [NSString stringWithFormat:@"Off"];
        NSLog(@"The music state is now %@", self.musicStatetoPass);

    }
}
@end
