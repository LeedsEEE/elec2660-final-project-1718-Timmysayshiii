//
//  InstructionsViewController.m
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 05/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "InstructionsViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "DataShared.h"
@interface InstructionsViewController ()
{
    AVAudioPlayer *MenuMusic;
}
@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    DataShared *data = [DataShared sharedInstance];

    // Construct URL to sound file
    NSString *path = [NSString stringWithFormat:@"%@/melodyloops-adrenaline.mp3", [[NSBundle mainBundle] resourcePath]];
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    MenuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    if ((self.placeholderSwitchState4 = @"On")) {
        NSLog(@"On");
        [MenuMusic play];
        
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)BackButton:(UIButton *)sender {
    [MenuMusic stop];
}
@end
