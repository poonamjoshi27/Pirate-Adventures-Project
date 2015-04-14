//
//  Character.m
//  Pirate Adventures
//
//  Created by Poonam Joshi on 08/04/2015.
//  Copyright (c) 2015 My Projects. All rights reserved.
//

#import "Character.h"

@implementation Character

- (void) updateCharacterStats : (Tile*) currentTile
{
    //update armor and health
    self.health = self.health + currentTile.healthBonus;
        //update weapon and damage
   // self.damage = self.damage + currentTile.damage;
    
}

- (void) updateCharacterPowers : (Tile*) currentTile
{
    if (currentTile.armor != nil)
    {
        Armor * currentArmor = self.armor;
        if (currentArmor != nil)
        {
            self.health = self.health - currentArmor.healthBonus + currentTile.armor.healthBonus;
            self.armor = currentTile.armor;
        }
        else
        {
            self.health = self.health + currentTile.armor.healthBonus;
            self.armor = currentTile.armor;
            
        }
    }
    if (currentTile.weapon != nil)
    {
        Weapon * currentWeapon = self.weapon;
        if (currentWeapon != nil)
        {
            self.damage = self.damage - currentWeapon.damage + currentTile.weapon.damage;
            self.weapon = currentTile.weapon;
        }
        else
        {
            self.damage= self.damage + currentTile.weapon.damage;
            self.weapon = currentTile.weapon;
            
        }
    }
    else
        self.damage = self.damage + currentTile.damage;

}

@end
