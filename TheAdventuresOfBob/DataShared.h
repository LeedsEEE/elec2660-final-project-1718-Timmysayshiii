//
//  DataShared.h
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid on 07/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataShared : NSObject

@property (nonatomic, copy) NSString *StateOfMusic;
@property (nonatomic, copy) NSString *userName;
@property int highscoreVal;

+ (DataShared *) sharedInstance;
@end
