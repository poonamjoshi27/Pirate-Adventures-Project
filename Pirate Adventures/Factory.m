//
//  TileFactory.m
//  Pirate Adventures
//
//  Created by Poonam Joshi on 28/10/2014.
//  Copyright (c) 2014 My Projects. All rights reserved.
//

#import "Factory.h"

@implementation Factory

- (NSArray*) getTiles
{
    
    NSMutableArray *d2ArrayOfTiles = [[NSMutableArray alloc] init];
    for (int i = 0; i < 4; i++)
    {
        NSMutableArray *d1ArrayOfTiles = [[NSMutableArray alloc] init];
        for (int j = 0; j < 3; j++)
        {
            [d1ArrayOfTiles addObject: [self createTile:i :j]];
            
        }
        [d2ArrayOfTiles addObject:d1ArrayOfTiles];
    }
    
    return d2ArrayOfTiles;
}
/*
 1. Each tile may or may not have an action.
 2. Each tile may increase or decrease your life just by stepping to the tile. As soon as you step on tile, characted stats need to be updated to reflect this default change in health stats.
 3. Each Tile may allow an action to pick up a weapon/armor. 
 4. WHen picking up a weapon, the damage quotient of the character goes up after adding in the damage of the weapon.
 5. Picking up an armor is a life bonus.
 6. Some actions may allow you to increase your damage quotient without picking up a weapon. Thus , wepon/armor/damage are updated only when user performs an action.
 */
-(Tile*) createTile : (int) x :(int) y
{
    Tile* myTile = [[Tile alloc] init];
    if (x==0 && y==0)
    {
        myTile.image = [UIImage imageNamed:@"PirateStart.jpg"];
        myTile.story =  @"Start your sail from here. You have 3 lives for a start.";
        myTile.action = nil;
        myTile.weapon = nil;
        myTile.armor = nil;
        myTile.healthBonus = 3;
        myTile.damage = 0;
    }
    else if (x==0 && y==1)
    {
        myTile.image = [UIImage imageNamed:@"PirateAttack.jpg"];
        myTile.story = @"Pirates have attacked your ship. You lose 2 of your lives in the attack. Pick up the Shield if you wish to get a health bonus.";
        myTile.action = @"Use Shield";
        myTile.armor = [self createArmor: x : y];
        myTile.weapon = nil;
        myTile.healthBonus = -2;
        myTile.damage = 0;
    }
    else if (x==0 && y==2)
    {
        myTile.image = [UIImage imageNamed:@"PirateTreasure.jpeg"];
        myTile.story = @"You have reached the treasure hoard of the pirate ship. You get a life bonus here. To add to your damage quotient, load coins.";
        myTile.action = @"Add coins";
        myTile.weapon = nil;
        myTile.armor = nil;
        myTile.healthBonus = 1;
        myTile.damage = 2;
    }
    else if (x==1 && y==0)
    {
        myTile.image = [UIImage imageNamed:@"PirateOctopusAttack.jpg"];
        myTile.story = @"Your ship is under attack from an octopus. You lose a life here. Pick up a spear to add to your damage quotient.";
        myTile.action = @"Pick up spear";
        myTile.weapon = [self createWeapon: x : y];
        myTile.armor = nil;
        myTile.healthBonus = -1;
        myTile.damage = 0;
    }
    else if (x==1 && y==1)
    {
        myTile.image = [UIImage imageNamed:@"PirateTreasurer2.jpeg"];
        myTile.story = @"You have reached the treasure hoard of the pirate ship. You get a life bonus here. To add to your damage quotient, load coins.";
        myTile.action = @"Add coins";
        myTile.armor = nil;
        myTile.weapon = nil;
        myTile.healthBonus = 1;
        myTile.damage = 2;
    }
    else if (x==1 && y==2)
    {
        myTile.image = [UIImage imageNamed:@"PirateBlacksmith.jpeg"];
        myTile.story = @"You have reached the blacksmith. Change your armor here.";
        myTile.action = @"Change Armor";
        myTile.weapon = nil;
        myTile.armor = [self createArmor: x : y];
        myTile.healthBonus = 0;
        myTile.damage = 0;
    }
    else if (x==2 && y==0)
    {
        myTile.image = [UIImage imageNamed:@"PirateParrot.jpg"];
        myTile.story = @"You have found the pirate's parrot. Capture the parrot for a life bonus and damage quotient.";
        myTile.action = @"Capture Parrot";
        myTile.weapon = nil;
        myTile.armor = nil;
        myTile.healthBonus = 1;
        myTile.damage = 2;
    }
    else if (x==2 && y==1)
    {
        myTile.image = [UIImage imageNamed:@"PiratePlank.jpg"];
        myTile.story = @"You have been captured by pirates. As a punishment, you need to walk the plank that causes you a life.";
        myTile.action = @"Walk Plank";
        myTile.weapon = nil;
        myTile.armor = nil;
        myTile.healthBonus = -1;
        myTile.damage = 0;

    }
    else if (x==2 && y==2)
    {
        myTile.image = [UIImage imageNamed:@"PirateShipBattle.jpeg"];
        myTile.story = @"Your ship has been rounded up by a pirate ship. You lose a life by default. To get a bonus damage quotient, pick up bow and arrows.";
        myTile.action = @"Pick up Bow and Arrow";
        myTile.weapon = [self createWeapon: x : y];
        myTile.armor = nil;
        myTile.healthBonus = -1;
        myTile.damage = 0;
        

    }
    else if (x==3 && y==0)
    {
        myTile.image = [UIImage imageNamed:@"PirateWeapons.jpeg"];
        myTile.story = @"You have reached the weapons store. You get a life bonus here. Pick up a sword. Sword has the highest damage quotient. ";
        myTile.action = @"Pick Sword";
        myTile.weapon = [self createWeapon:x : y];
        myTile.armor = nil;
        myTile.healthBonus = 1;
        myTile.damage = 0;
    }
    else if (x==3 && y==1)
    {
        myTile.image = [UIImage imageNamed:@"PirateFriendlyDock.jpg"];
        myTile.story = @"You have reached friednly dock.";
        myTile.action = nil;
        myTile.weapon = nil;
        myTile.armor = nil;
        myTile.healthBonus = 1;
        myTile.damage = 0;
    }
    else if (x==3 && y==2)
    {
        myTile.image = [UIImage imageNamed:@"PirateBoss.jpeg"];
        myTile.story = @"You have reached the BOSS of the pirate ship. You win the game if you defeat the boss.";
        myTile.action = @"Strike";
        myTile.weapon = nil;
        myTile.armor = nil;
        myTile.healthBonus = 0;
        myTile.damage = 0;
    }
    
    return myTile;
}

- (Character*) createCharacter
{
    Character* character = [[Character alloc] init];
    character.health = 0;
    character.damage = 0;
    character.weapon = nil;
    character.armor = nil;
    
    return character;
}
- (Boss*) createBoss
{
    Boss* boss = [[Boss alloc] init];
    boss.health = 10;
    return boss;
}


- (Weapon*) createWeapon : (int) x : (int) y
{
    Weapon *weapon = [[Weapon alloc] init];
    
    if(x==3 && y ==0)
    {
        weapon.name = @"Sword";
        weapon.damage = 3;
    }
    else if (x ==2 && y==2)
    {
        weapon.name = @"Arrows";
        weapon.damage = 2;
    }
    else if (x==1 && y==0)
    {
        weapon.name = @"Spear";
        weapon.damage = 1;
    }
    else return nil;
    return weapon;
}

- (Armor*) createArmor : (int) x : (int) y
{
    Armor *armor = [[Armor alloc] init];
    
    if(x==0 && y==1)
    {
        armor.name = @"Shield";
        armor.healthBonus = 2;
    }
    else if (x==1 && y==2)
    {
        armor.name = @"Metal plates";
        armor.healthBonus = 3;
    }
    else return nil;
    return armor;
}
@end
