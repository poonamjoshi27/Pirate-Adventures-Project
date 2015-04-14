//
//  Tile.h
//  Pirate Adventures
//
//  Created by Poonam Joshi on 27/10/2014.
//  Copyright (c) 2014 My Projects. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Weapon.h"
#import "Armor.h"

@interface Tile : NSObject

@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) NSString *tileName;
@property (strong, nonatomic) NSString *story;
@property (strong, nonatomic) NSString *action;
@property (strong, nonatomic) Weapon *weapon;
@property (strong, nonatomic) Armor *armor;
@property (nonatomic) int healthBonus;
@property (nonatomic) int damage;

/*- (void) setImage : (UIImage*) image;
- (void) setTileName : (NSString*) tileName;
- (void) setStory : (NSString*) story;
- (void) setAction : (NSString*) action;

- (UIImage*) getImage ;
- (NSString*) getTileName ;
- (NSString*) getStory ;
- (NSString*) getAction ;*/

@end
