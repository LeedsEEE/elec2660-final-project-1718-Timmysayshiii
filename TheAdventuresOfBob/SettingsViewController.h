//
//  SettingsViewController.h
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid [ll15os] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *enterName;
@property (weak, nonatomic) IBOutlet UITableView *highScoreTable;
@property (weak, nonatomic) IBOutlet UILabel *musicState;
@property (strong, nonatomic) NSString *musicStatetoPass;


- (IBAction)musicState:(UISwitch *)sender;
- (IBAction)MassiveButton:(UIControl *)sender;
- (IBAction)BackButtonPressed:(UIButton *)sender;


@end
