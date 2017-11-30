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

int Chanceofattack;
float bunnySpeed;
int randomSpeed;
int score;

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Displays the elements needed for the game when we press start. In turn the menu will be hidden.
    
    self.FistAttack.hidden = true;
    self.HealthBar.hidden = false;
    self.Score.hidden = false;
    self.Healthlabel.hidden = false;
    self.BorgBunnySprite.hidden = false;
    self.RoadmanShaq.hidden = false;
    self.AttackbuttonX.hidden = false;
    
    // Set the original value for score/health and using a string to display this.
    
    self.Score.text = [NSString stringWithFormat:@"Score:   %d", score];
    self.HealthBar.progress = 1;
    
    // Setting the original positions for the sprites for when the game will load.
    
    self.RoadmanShaq.center = CGPointMake(50, 350);
    self.BorgBunnySprite.center = CGPointMake(770, 350);
    self.FistAttack.center = CGPointMake(self.RoadmanShaq.center.x, self.RoadmanShaq.center.y);
    self.Fireball.center = CGPointMake(self.BorgBunnySprite.center.x, self.BorgBunnySprite.center.y);
    self.egg1.center = CGPointMake(200, -20);
   
    [self bunnyPosition];
   
    self.eggMovementTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(eggMovement) userInfo:nil repeats:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)StartGame:(UIButton *)sender {
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}


// Implementing the method of touchesMoved to move my sprite in the direction we tap the screen.

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.touch= [touches anyObject];
    // Can implement If statements for better control
    
    CGPoint point = [self.touch locationInView:self.view];
    self.RoadmanShaq.center = CGPointMake(point.x, self.RoadmanShaq.center.y);
}

// Method for the attack button to launch a projectile attack.

- (IBAction)AttackButton:(UIButton *)sender {
    [self.fistattackMovementTimer invalidate];
    self.FistAttack.hidden = false;
    self.FistAttack.center = CGPointMake(self.RoadmanShaq.center.x, self.RoadmanShaq.center.y);
    
    self.fistattackMovementTimer = [NSTimer scheduledTimerWithTimeInterval:0.0*1 target:self selector:@selector(fistattackMovement) userInfo:nil repeats:YES];
}

// ENDED HERE

-(void)fistattackMovement {
  
    self.FistAttack.hidden = NO;
    self.FistAttack.center = CGPointMake(self.FistAttack.center.x + 10, self.FistAttack.center.y);
    //int width = (int)self.view.frame.size.width;
    
    /*[UIView animateWithDuration:0.4 animations:^{
       self.FistAttack.center = CGPointMake(self.FistAttack.center.x + 600, self.FistAttack.center.y);
    }
    completion:^(BOOL finished){
        self.FistAttack.hidden = true;
    }];*/
    
    // If the two sprites collide, the user will gain score
    if (CGRectIntersectsRect(self.FistAttack.frame, self.BorgBunnySprite.frame)) {
        score = score + 1;
        self.Score.text = [NSString stringWithFormat:@"Score:   %d", score];
        
        // Stops the movement of the projectile
        [self.fistattackMovementTimer invalidate];
        
        // Recenters the attack projectile back to the users sprite
        self.FistAttack.center = CGPointMake(self.RoadmanShaq.center.x, self.RoadmanShaq.center.y);
        self.FistAttack.hidden = true;
        
        //Stops the bunny from moving and then recenters for another attack
        [self.bunnyMovementTimer invalidate];
        [self bunnyPosition];
    }
}

-(void)bunnyMovementTimerx {
    // Creating random speeds for the bunny to move at
    
    
    self.bunnyMovementTimer = [NSTimer scheduledTimerWithTimeInterval:bunnySpeed target:self selector:@selector(bunnyMovement) userInfo:nil repeats:YES];
}

-(void)bunnyPosition {
    //Randomises a position for the enemy
    /*NSInteger enemyPosition=0;
    NSInteger bunnyPosition=0;
    
    enemyPosition = arc4random() % 249;
    bunnyPosition = enemyPosition +20;*/
    
    // Sets the position for the enemy sprite
    self.BorgBunnySprite.center = CGPointMake(770, 350);
    
    //Sets the speed that the bunny will attack
    randomSpeed = arc4random() % 3;
    switch (randomSpeed) {
        case 0:
            bunnySpeed = 0.003;
            break;
        case 1:
            bunnySpeed = 0.002;
            break;
        case 2:
            bunnySpeed = 0.001;
        default:
            break;
    }
    
    // Sets how quick new attacks will occur
    Chanceofattack = arc4random() % 5;
    [self performSelector:@selector(bunnyMovementTimerx) withObject:nil afterDelay:Chanceofattack];
    
}

-(void)bunnyMovement {
    self.BorgBunnySprite.center = CGPointMake(self.BorgBunnySprite.center.x - 10, self.BorgBunnySprite.center.y);
    /*[UIView animateWithDuration:0.4 animations:^{
        self.BorgBunnySprite.center = CGPointMake(self.BorgBunnySprite.center.x+10, self.BorgBunnySprite.center.y);} completion:^(BOOL finished){
        }];*/
    
    // If a collision between the two sprites occur, health will be deducted.
    if (CGRectIntersectsRect(self.BorgBunnySprite.frame, self.RoadmanShaq.frame)) {
        self.HealthBar.progress = self.HealthBar.progress - 0.2;
        [self.bunnyMovementTimer invalidate];
    }
    
    // If the user still has health left, the sprite will relocate for another attack and game will still be active
    if (self.HealthBar > 0) {
        [self bunnyPosition];
    }
    
    // If the user has no health, the game will be over
    if (self.HealthBar == 0) {
        [self GameOver];
    }
}

-(void)eggMovement {
    self.egg1.center = CGPointMake(self.egg1.center.x, self.egg1.center.y +3);
    self.egg2.center = CGPointMake(self.egg2.center.x, self.egg2.center.y +3);
    self.egg3.center = CGPointMake(self.egg3.center.x, self.egg3.center.y +3);
    self.egg4.center = CGPointMake(self.egg4.center.x, self.egg4.center.y +3);
    
    
}

-(void)GameOver {
    // stops the movement for projectiles and enemies
    [self.bunnyMovementTimer invalidate];
    [self.fistattackMovementTimer invalidate];
    
    // Waits for roughly 7 seconds before the game will initilise replay
    [self performSelector:@selector(ReplayGame) withObject:nil afterDelay:7];
}

-(void)ReplayGame {
    // Restarts the game code
    // Hiding all elements other than the menu in the start up screen of the game.
    
    self.HealthBar.hidden = true;
    self.Score.hidden = true;
    self.Healthlabel.hidden = true;
    self.BorgBunnySprite.hidden = true;
    self.Fireball.hidden = true;
    self.RoadmanShaq.hidden = true;
    self.FistAttack.hidden = true;
    self.AttackbuttonX.hidden = true;
    
    // Set the original value for score/health and using a string to display this.
    
    NSInteger score = 0;
    self.Score.text = [NSString stringWithFormat:@"Score:   %ld", score];
    self.HealthBar.progress = 1;
    
    // Setting the original positions for the sprites for when the game will load.
    
    self.RoadmanShaq.center = CGPointMake(50, 350);
    self.BorgBunnySprite.center = CGPointMake(770, 350);
    self.FistAttack.center = CGPointMake(_RoadmanShaq.center.x, _RoadmanShaq.center.y);
    self.Fireball.center = CGPointMake(_BorgBunnySprite.center.x, _BorgBunnySprite.center.y);
    
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
