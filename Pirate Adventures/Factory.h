//
//  TileFactory.h
//  Pirate Adventures
//
//  Created by Poonam Joshi on 28/10/2014.
//  Copyright (c) 2014 My Projects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"
#import "Character.h"
#import "Boss.h"


@interface Factory : NSObject

- (NSArray*) getTiles;
- (Tile*) createTile : (int) x :(int) y;
- (Character*) createCharacter;
- (Boss*) createBoss;
- (Weapon*) createWeapon : (int) x : (int) y;
- (Armor*) createArmor : (int) x : (int) y;

@end
