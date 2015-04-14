//
//  Boss.m
//  Pirate Adventures
//
//  Created by Poonam Joshi on 10/04/2015.
//  Copyright (c) 2015 My Projects. All rights reserved.
//

#import "Boss.h"


@implementation Boss

- (void) updateBossStats : (Character*) character
{
    self.health = self.health - character.damage;
}

@end
