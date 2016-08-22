//
//  ViewController.m
//  HelpWanted
//
//  Created by Miquel on 16/8/16.
//  Copyright © 2016 Miquel. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGPoint frame = helpWantedEntrada.center;
    frame.y -= 200;
    helpWantedEntrada.center = frame;
    
    self->animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    
    UIGravityBehavior* gravityBehavior =
    [[UIGravityBehavior alloc] initWithItems:@[self->helpWantedEntrada]];
    [self->animator addBehavior:gravityBehavior];
    
    UICollisionBehavior* collisionBehavior =
    [[UICollisionBehavior alloc] initWithItems:@[self->helpWantedEntrada]];

    [collisionBehavior setTranslatesReferenceBoundsIntoBoundaryWithInsets:UIEdgeInsetsMake(20, 20, 210, 40)];
    [self->animator addBehavior:collisionBehavior];
    
    UIDynamicItemBehavior *elasticityBehavior =
    [[UIDynamicItemBehavior alloc] initWithItems:@[self->helpWantedEntrada]];
    elasticityBehavior.elasticity = 0.4f;
    [self->animator addBehavior:elasticityBehavior];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
