//
//  SKEmitterNode+RCWExtensions.h
//  SpaceRun
//
//  Created by Austin Cherry on 3/10/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface SKEmitterNode (RCWExtensions)

+ (SKEmitterNode *)rcw_nodeWithFile:(NSString *)filename;
- (void)rcw_dieOutInDuration:(NSTimeInterval)duration;

@end
