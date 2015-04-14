//
//  Boss.h
//  Pirate Adventures
//
//  Created by Poonam Joshi on 10/04/2015.
//  Copyright (c) 2015 My Projects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Character.h"

@interface Boss : NSObject
@property (nonatomic) int health;

- (void) updateBossStats : (Character*) character;
@end
