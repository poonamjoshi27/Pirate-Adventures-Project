//
//  ViewController.h
//  Pirate Adventures
//
//  Created by Poonam Joshi on 27/10/2014.
//  Copyright (c) 2014 My Projects. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Factory.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) NSArray *arrayOfTiles;
@property (strong,nonatomic) Character *character;
@property (strong,nonatomic) Boss *boss;
@property (nonatomic) CGPoint currentPoint;
@property (nonatomic) CGPoint maxPoint;

@property (strong, nonatomic) IBOutlet UIButton *moveRightButton;
@property (strong, nonatomic) IBOutlet UIButton *moveLeftButton;
@property (strong, nonatomic) IBOutlet UIButton *moveUpButton;
@property (strong, nonatomic) IBOutlet UIButton *moveDownButton;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *coordinateLabel;
@property (strong, nonatomic) IBOutlet UILabel *actionLabel;

@property (strong, nonatomic) IBOutlet UILabel *storyLabel;
@property (strong, nonatomic) IBOutlet UILabel *weaponStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *armorStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *healthStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *damageStatLabel;
@property (strong, nonatomic) IBOutlet UILabel *bossStatLabel;

- (IBAction)actionButtonPressed:(UIButton *)sender;

- (IBAction)moveLeftButtonPressed:(UIButton *)sender;

- (IBAction)climbUpButtonPressed:(UIButton *)sender;

- (IBAction)moveDownButtonPressed:(UIButton *)sender;

- (void) updateButtonStates;

- (void) updateCoordinateLabel;

- (void) updateView;

- (void) updateStatsView;

- (void) showGameOverAlert;

- (void) showGameWonAlert;

- (void) fightBoss;

- (void) updateBossStatsView;
@end

