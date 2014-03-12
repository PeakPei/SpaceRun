///////////////////////////////////////////////////////////////////////////////////////
//
//  RCWHUDNode.h
//  SpaceRun
//
//  Created by Austin Cherry on 3/11/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////////////////

#import <SpriteKit/SpriteKit.h>

@interface RCWHUDNode : SKNode

@property (nonatomic) NSTimeInterval elapsedTime;
@property (nonatomic) NSInteger score;

- (void)addPoints:(NSInteger)score;
- (void)startGame;
- (void)endGame;
- (void)layoutForScene;
- (void)showPowerupTimer:(NSTimeInterval)timer;

@end
