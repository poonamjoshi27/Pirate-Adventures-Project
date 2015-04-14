//
//  Character.h
//  Pirate Adventures
//
//  Created by Poonam Joshi on 08/04/2015.
//  Copyright (c) 2015 My Projects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Weapon.h"
#import "Armor.h"
#import "Tile.h"

@interface Character : NSObject

@property (nonatomic) int health;
@property (nonatomic) int damage;
@property (nonatomic,strong) Weapon* weapon;
@property (nonatomic,strong) Armor* armor;

- (void) updateCharacterStats : (Tile*) currentTile ;
- (void) updateCharacterPowers : (Tile*) currentTile;

@end
