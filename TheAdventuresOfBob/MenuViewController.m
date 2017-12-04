//
//  MenuViewController.m
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 29/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "MenuViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface MenuViewController ()

{
    AVAudioPlayer *MenuMusic;
}

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
        
        // Construct URL to sound file
        NSString *path = [NSString stringWithFormat:@"%@/FILENAME.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        MenuMusic = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    //if (musicStatetoPass == 1) {
    [MenuMusic play];
    //}
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

@end
