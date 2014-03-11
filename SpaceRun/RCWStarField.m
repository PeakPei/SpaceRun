///////////////////////////////////////////////////////////////////////////////////////
//
//  RCWStarField.m
//  SpaceRun
//
//  Created by Austin Cherry on 3/9/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////////////////

#import "RCWStarField.h"

@implementation RCWStarField

- (instancetype)init
{
    if (self = [super init])
    {
        __weak RCWStarField *weakSelf = self;
        SKAction *update =[SKAction runBlock:^{
            if (arc4random_uniform(10) < 3)
                [weakSelf launchStar];
        }];
        SKAction *delay = [SKAction waitForDuration:0.01];
        SKAction *updateLoop = [SKAction sequence:@[delay, update]];
        [self runAction:[SKAction repeatActionForever:updateLoop]];
    }
    return self;
}

- (void)launchStar
{
    CGFloat randX = arc4random_uniform(self.scene.size.width);
    CGFloat maxY = self.scene.size.height;
    CGPoint randomStart = CGPointMake(randX, maxY);
    
    SKSpriteNode *star = [SKSpriteNode spriteNodeWithImageNamed:@"shootingstar"];
    star.position = randomStart;
    star.size = CGSizeMake(2, 10);
    star.alpha = 0.1 + arc4random_uniform(10) / 10.0f - 0.1;
    [self addChild:star];
    
    CGFloat destY = 0 - self.scene.size.height - star.size.height;
    CGFloat duration = 0.1 + arc4random_uniform(10) / 10.0f;
    SKAction *move = [SKAction moveByX:0 y:destY duration:duration];
    SKAction *remove = [SKAction removeFromParent];
    [star runAction:[SKAction sequence:@[move, remove]]];
}


@end
