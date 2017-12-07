//
//  DataShared.m
//  TheAdventuresOfBob
//
//  Created by Obeid Shahid on 07/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "DataShared.h"

@implementation DataShared
static DataShared *_sharedInstance;
@synthesize StateOfMusic = _StateOfMusic, highscoreVal = _highscoreVal, userName = _userName;
- (id) init {
    if (self = [super init]) {
        // custom initialization
    }
    return self;
}

+ (DataShared  *) sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[DataShared alloc] init];
    }
    return _sharedInstance;
}

@end

