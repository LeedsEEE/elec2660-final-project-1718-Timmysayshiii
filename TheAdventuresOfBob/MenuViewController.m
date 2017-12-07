//
//  MenuViewController.m
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "MenuViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "SettingsViewController.h"
#import "DataShared.h"
@interface MenuViewController ()

{
    AVAudioPlayer *MenuMusic;
}

@end

@implementation MenuViewController
@synthesize placeholderSwitchState;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    DataShared *data = [DataShared sharedInstance];

    self.SwitchStateLabel.hidden = true;
    NSLog(@"Value passed down to menu is %@",self.placeholderSwitchState);
        // Construct URL to sound file
        NSString *path = [NSString stringWithFormat:@"%@/melodyloops-adrenaline.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        MenuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    if ((self.placeholderSwitchState = @"On")) {
       NSLog(@"The switch state recieved in menu is %@" , self.placeholderSwitchState);
       [MenuMusic play];
    }
    
   else if ((self.placeholderSwitchState = @"Off")) {
        NSLog(@"The switch state recieved in menu is %@" , self.placeholderSwitchState);
        [MenuMusic stop];
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)StartGamePressed:(UIButton *)sender {
    [MenuMusic stop];
}

- (IBAction)InstructionsPrssed:(UIButton *)sender {
     [MenuMusic stop];
}

- (IBAction)SettingsPressed:(UIButton *)sender {
     [MenuMusic stop];
}
@end
