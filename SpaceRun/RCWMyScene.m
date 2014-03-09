//
//  RCWMyScene.m
//  SpaceRun
//
//  Created by Austin Cherry on 3/8/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//

#import "RCWMyScene.h"

@interface RCWMyScene ()
@property (nonatomic, weak) UITouch *shipTouch;
@property (nonatomic) NSTimeInterval lastUpdateTime;
@end

@implementation RCWMyScene

- (id)initWithSize:(CGSize)size
{
    if (self = [super initWithSize:size])
    {
        self.backgroundColor = [SKColor blackColor];
        NSString *name = @"Spaceship.png";
        SKSpriteNode *ship = [SKSpriteNode spriteNodeWithImageNamed:name];
        ship.position = CGPointMake(size.width/2, size.height/2);
        ship.size = CGSizeMake(40, 40);
        ship.name = @"ship";
        [self addChild:ship];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.shipTouch = [touches anyObject];
}

- (void)update:(NSTimeInterval)currentTime
{
    if (self.lastUpdateTime == 0)
    {
        self.lastUpdateTime = currentTime;
    }
    NSTimeInterval timeDelta = currentTime - self.lastUpdateTime;
    if (self.shipTouch)
    {
        [self moveShipByTimeDelta:timeDelta];
    }
    self.lastUpdateTime = currentTime;
}

- (void)moveShipByTimeDelta:(NSTimeInterval)timeDelta
{
    CGFloat shipSpeed = 130; // points per second
    SKNode *ship = [self childNodeWithName:@"ship"];
    CGPoint dest = [self.shipTouch locationInNode:self];
    CGFloat distanceLeft = sqrt(pow(ship.position.x - dest.x, 2) +
                                pow(ship.position.y - dest.y, 2));
    
    if (distanceLeft > 4) {
        CGFloat distanceToTravel = timeDelta * shipSpeed;
        
        CGFloat angle = atan2(dest.x - ship.position.x,
                              dest.y - ship.position.y);
        CGFloat yOffset = distanceToTravel * cos(angle);
        CGFloat xOffset = distanceToTravel * sin(angle);
        
        ship.position = CGPointMake(ship.position.x + xOffset,
                                    ship.position.y + yOffset);
    }
}

@end
