///////////////////////////////////////////////////////////////////////////////////////
//
//  RCWViewController.m
//  SpaceRun
//
//  Created by Austin Cherry on 3/8/14.
//  Copyright (c) 2014 Vluxe. All rights reserved.
//
///////////////////////////////////////////////////////////////////////////////////////

#import "RCWViewController.h"
#import "RCWMyScene.h"
#import "RCWOpeningScene.h"

@implementation RCWViewController

///////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    SKScene *blackScene = [[SKScene alloc] initWithSize:skView.bounds.size];
    blackScene.backgroundColor = [SKColor blackColor];
    [skView presentScene:blackScene];
    
    // Create and configure the scene.
    RCWMyScene *scene = [RCWMyScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    scene.easyMode = self.easyMode;
    
    __weak RCWViewController *weakSelf = self;
    scene.endGameCallback = ^{
        [weakSelf.navigationController popViewControllerAnimated:YES];
    };
    
    // Present the scene.
    [skView presentScene:scene];
}
///////////////////////////////////////////////////////////////////////////////////////
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    SKView *skView = (SKView *)self.view;
    
    RCWOpeningScene *scene = [RCWOpeningScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    SKTransition *transition = [SKTransition fadeWithDuration:1];
    [skView presentScene:scene transition:transition];
    
    // ...
    
    __weak RCWViewController *weakSelf = self;
    scene.sceneEndCallback = ^{
        RCWMyScene *scene = [RCWMyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        scene.easyMode = weakSelf.easyMode;
        
        scene.endGameCallback = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
        
        SKTransition *transition = [SKTransition fadeWithColor:[SKColor blackColor]
                                                      duration:1];
        [skView presentScene:scene transition:transition];
    };
}
///////////////////////////////////////////////////////////////////////////////////////
- (BOOL)shouldAutorotate
{
    return YES;
}
///////////////////////////////////////////////////////////////////////////////////////
- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}
///////////////////////////////////////////////////////////////////////////////////////

@end
