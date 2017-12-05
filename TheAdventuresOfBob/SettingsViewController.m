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
@interface SettingsViewController ()
{
    AVAudioPlayer *MenuMusic;
}
@end

@implementation SettingsViewController

- (void)viewDidLoad {
    
    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/melodyloops-adrenaline.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    MenuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    if ((self.musicStatetoPass = @"On")) {
        NSLog(@"On");
        [MenuMusic play];
    }
    else {
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
    }
    
    if ([segue.identifier isEqualToString:@"PlayerNamePassOver"]){
        ViewController *Controller2 = (ViewController *)segue.destinationViewController;
        Controller2.placeholderSwitchState2= _musicStatetoPass;
    }
    
    if ([segue.identifier isEqualToString:@"PassOverSettings"]){
        SettingsViewController *Controller3 = (SettingsViewController *)segue.destinationViewController;
        Controller3.placeholderSwitchState3= _musicStatetoPass;
    }

  

}



- (IBAction)MassiveButton:(UIControl *)sender {
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
    
    return YES;
    // Removes keyboard from view when we press return
}

- (IBAction)musicState:(UISwitch *)sender {
    if (sender.on) {
        self.musicState.text = [NSString stringWithFormat:@"Music State: ON"];
        self.musicStatetoPass = [NSString stringWithFormat:@"On"]; ;
    }
    
    else {
        self.musicState.text = [NSString stringWithFormat:@"Music State: OFF"];
        self.musicStatetoPass = [NSString stringWithFormat:@"Off"];
    }
}
@end
