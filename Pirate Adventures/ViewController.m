//
//  ViewController.m
//  Pirate Adventures
//
//  Created by Poonam Joshi on 27/10/2014.
//  Copyright (c) 2014 My Projects. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Initialize
    self.maxPoint = CGPointMake(3,2);
    self.currentPoint = CGPointMake(0, 0);
    
    Factory *myTileFactory = [[Factory alloc] init];
    self.arrayOfTiles = [myTileFactory getTiles];
    self.character = [myTileFactory createCharacter];
    self.boss = [myTileFactory createBoss];
    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actionButtonPressed:(UIButton *)sender
{
    int x = self.currentPoint.x;
    int y = self.currentPoint.y;
    Tile *currentTile = self.arrayOfTiles[x][y];

    //[self.character updateCharacterStats: currentTile];
    [self.character updateCharacterPowers : currentTile];
    if (x==3 && y==2)
    {
        [self fightBoss];
        [self updateBossStatsView];
    }
    else
    {
        self.actionButton.enabled = NO;
    }
    [self updateStatsView];
    
    
}

- (IBAction)moveRightButtonPressed:(UIButton *)sender {
    int currentX = self.currentPoint.x;
    int currentY = self.currentPoint.y;
    
    self.currentPoint = CGPointMake(++currentX, currentY);
    NSLog (@"CurrentPoint (%f,%f)", self.currentPoint.x, self.currentPoint.y);
    //[UIView transitionWithView:self.view duration:1.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
    
    [self updateView];
   // } completion:^(BOOL finished) {
        
    //}];
    
}


- (IBAction)moveLeftButtonPressed:(UIButton *)sender {
    int currentX = self.currentPoint.x;
    int currentY = self.currentPoint.y;
    
    self.currentPoint = CGPointMake(--currentX, currentY);
        NSLog (@"CurrentPoint (%f,%f)", self.currentPoint.x, self.currentPoint.y);
   // [UIView transitionWithView:self.view duration:1.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
        [self updateView];
    //} completion:^(BOOL finished) {
        
    //}];
}

- (IBAction)climbUpButtonPressed:(UIButton *)sender {
    int currentX = self.currentPoint.x;
    int currentY = self.currentPoint.y;
    
    self.currentPoint = CGPointMake(currentX, ++currentY);
        NSLog (@"CurrentPoint (%f,%f)", self.currentPoint.x, self.currentPoint.y);
   // [UIView transitionWithView:self.view duration:1.5 options:UIViewAnimationOptionTransitionFlipFromBottom animations:^{
        [self updateView];
    //} completion:^(BOOL finished) {
        
   // }];
}

- (IBAction)moveDownButtonPressed:(UIButton *)sender {
    int currentX = self.currentPoint.x;
    int currentY = self.currentPoint.y;
    
    self.currentPoint = CGPointMake(currentX, --currentY);
        NSLog (@"CurrentPoint (%f,%f)", self.currentPoint.x, self.currentPoint.y);
  //  [UIView transitionWithView:self.view duration:1.5 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        [self updateView];
    //} completion:^(BOOL finished) {
        
    //}];
}



- (void) updateButtonStates
{
    /*if (self.currentPoint.x == 0)
        self.moveLeftButton.enabled = NO;
    else
        self.moveLeftButton.enabled = YES;

    
    if (self.currentPoint.x == self.maxPoint.x)
        self.moveRightButton.enabled = NO;
    else
        self.moveRightButton.enabled = YES;
    
    if (self.currentPoint.y == 0)
        self.moveDownButton.enabled = NO;
    else
        self.moveDownButton.enabled = YES;
    
    if (self.currentPoint.y == self.maxPoint.y)
        self.moveUpButton.enabled = NO;
    else
        self.moveUpButton.enabled = YES;*/
    if (self.currentPoint.x == 0 )
        self.moveLeftButton.enabled = NO;
    else
        self.moveLeftButton.enabled = YES;
    
    
    if (self.currentPoint.x == self.maxPoint.x)
        self.moveRightButton.enabled = NO;
    else
        self.moveRightButton.enabled = YES;
    
    if (self.currentPoint.y == 0 )
        self.moveDownButton.enabled = NO;
    else
        self.moveDownButton.enabled = YES;
    
    if (self.currentPoint.y == self.maxPoint.y)
        self.moveUpButton.enabled = NO;
    else
        self.moveUpButton.enabled = YES;
    
    // disable going to the first tile
    if (self.currentPoint.x == 0 && self.currentPoint.y == 1)
        self.moveDownButton.enabled = NO;
    if (self.currentPoint.x == 1 && self.currentPoint.y == 0)
        self.moveLeftButton.enabled = NO;
        
}

- (void) updateCoordinateLabel
{
    NSString *myXString = [NSString stringWithFormat:@"%g", self.currentPoint.x ];
    NSString *myYString = [NSString stringWithFormat:@"%g", self.currentPoint.y ];
    NSString *labelString = @"(";
    labelString = [[[[labelString stringByAppendingString:myXString] stringByAppendingString:@","] stringByAppendingString:myYString] stringByAppendingString:@")"];
    self.coordinateLabel.text = labelString;
}

- (void) updateActionButtonLabel
{
    int x = self.currentPoint.x;
    int y = self.currentPoint.y;
    Tile *currentTile = self.arrayOfTiles[x][y];
    if (currentTile.action == nil)
    {
        self.actionLabel.text = @"No Action";
        self.actionButton.enabled = NO;
    }
    else
    {
        self.actionLabel.text = currentTile.action;
        self.actionButton.enabled = YES;
    }

}

- (void) updateStatsView
{
    if (self.character.weapon == nil)
        self.weaponStatLabel.text = @"None";
    else
        self.weaponStatLabel.text = self.character.weapon.name;
    if (self.character.armor == nil)
        self.armorStatLabel.text = @"None";
    else
        self.armorStatLabel.text  = self.character.armor.name;
    self.healthStatLabel.text = [NSString stringWithFormat:@"%i",self.character.health];
    self.damageStatLabel.text = [NSString stringWithFormat:@"%i",self.character.damage];
    if (self.character.health <= 0 )
    {
        [self showGameOverAlert];
    }
    else if (self.boss.health <=0)
    {
        [self showGameWonAlert];
    }
}


- (void) updateView
{
    int x = self.currentPoint.x;
    int y = self.currentPoint.y;
    Tile *currentTile = self.arrayOfTiles[x][y];
    self.imageView.image = currentTile.image;
  
    self.storyLabel.text= currentTile.story;
    [self updateCoordinateLabel];
    [self updateButtonStates];
    [self updateActionButtonLabel];
    [self.character updateCharacterStats:currentTile];
    [self updateStatsView];
    [self updateBossStatsView];
}

- (void) showGameOverAlert
{
    //disable all navigation and show alert
    self.moveLeftButton.enabled = NO;
    self.moveRightButton.enabled = NO;
    self.moveUpButton.enabled = NO;
    self.moveDownButton.enabled = NO;
    self.actionButton.enabled = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:@"Play Again" delegate : nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
   
}

- (void) showGameWonAlert
{
    //disable all navigation and show alert
    self.moveLeftButton.enabled = NO;
    self.moveRightButton.enabled = NO;
    self.moveUpButton.enabled = NO;
    self.moveDownButton.enabled = NO;
    self.actionButton.enabled = NO;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:@"You win" delegate : nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    
    [alert show];
    
}

- (void) fightBoss
{
    if (self.character.damage > 0)
    {
        if (self.character.weapon !=nil)
        {
            self.character.damage =  self.character.damage - self.character.weapon.damage;
            self.boss.health = self.boss.health - self.character.weapon.damage;
        }
        else{
            self.character.damage =  self.character.damage - 1;
            self.boss.health = self.boss.health - 1;
        }
    }
}

- (void) updateBossStatsView
{
    self.bossStatLabel.text = [NSString stringWithFormat:@"%i",self.boss.health];
}
@end
