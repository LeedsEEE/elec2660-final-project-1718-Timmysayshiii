//
//  ViewController.m
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 13/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Hiding all elements other than the menu in the start up screen of the game.
    
    self.HealthBar.hidden = true;
    self.Score.hidden = true;
    self.Healthlabel.hidden = true;
    self.BorgBunnySprite.hidden = true;
    self.Fireball.hidden = true;
    self.RoadmanShaq.hidden = true;
    self.FistAttack.hidden = true;
    self.AttackbuttonX.hidden = true;
    
    // Set the original value for score and using a string to display this.
    
    NSInteger score = 0;
    self.Score.text = [NSString stringWithFormat:@"Score:   %ld", score];
    
    // Setting the original positions for the sprites for when the game will load.
    
    self.RoadmanShaq.center = CGPointMake(50, 350);
    self.BorgBunnySprite.center = CGPointMake(350, 350);
    self.FistAttack.center = CGPointMake(_RoadmanShaq.center.x, _RoadmanShaq.center.y);
    self.Fireball.center = CGPointMake(_BorgBunnySprite.center.x, _BorgBunnySprite.center.y);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)StartGame:(UIButton *)sender {
    
    // Displays the elements needed for the game when we press start. In turn the menu will be hidden.
    
    self.instructionsbutton.hidden = true;
    self.Settingsbutton.hidden = true;
    self.startgamebutton.hidden = true;
    self.HealthBar.hidden = false;
    self.Score.hidden = false;
    self.Healthlabel.hidden = false;
    self.BorgBunnySprite.hidden = false;
    self.Fireball.hidden = false;
    self.RoadmanShaq.hidden = false;
    self.AttackbuttonX.hidden = false;
    
}

- (IBAction)AttackButton:(UIButton *)sender {
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}

// Implementing the method of touchesMoved to move my sprite in the direction we tap the screen.

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.touch= [touches anyObject];
    CGPoint point = [_touch locationInView:self.view];
    _RoadmanShaq.center = CGPointMake(point.x, _RoadmanShaq.center.y);
}

@end


/* References

 Background Image
 https://www.shutterstock.com/image-vector/high-quality-horizontal-seamless-background-landscape-555408847?src=aRWJoC8zBWet2x-B58pOkQ-1-19
 
 Fist Attack Pickture
 http://all-free-download.com/free-vector/download/fist-outline-lineart-clip-art_18637.html
 
 Fireball Picture
 https://www.giantbomb.com/fireball/3055-120/
 
 Roadman Shaq
 https://img.buzzfeed.com/buzzfeed-static/static/2017-10/16/11/asset/buzzfeed-prod-fastlane-01/sub-buzz-29381-1508166343-1.jpg?downsize=715:*&output-format=auto&output-quality=auto
 (Copy paste as the star within the link interupts)
 
 Evil Bunny
 https://img00.deviantart.net/4733/i/2012/141/d/5/cyborg_bunny_by_crowsrock-d50l4tg.png
 
 VS image
 https://pre00.deviantart.net/e95c/th/pre/f/2017/183/7/f/yu_gi_oh__vrains__vs_screen__by_yugiohdragon999-dbet005.png
 
 Res/Blue colour background
 http://www.wallpapersxl.com/wallpaper/1920x1200/baground-wall-paper-hd-color-2066432.html?from=wallp
 
 Settings Background
 https://openclipart.org/image/2400px/svg_to_png/271573/ColourfulBackgroundColour2.png
 
 Instructions stage
 https://www.artstation.com/artwork/0knXw
*/
