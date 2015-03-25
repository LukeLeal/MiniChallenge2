//
//  OpcoesJogosViewController.m
//  Challenge 2
//
//  Created by Amanda Guimaraes Campos on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "JogosViewController.h"

@interface JogosViewController ()

@end

@implementation JogosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}


#pragma mark - Ações de botões
- (IBAction)memoriaBotao:(id)sender {
}

- (IBAction)quizBotao:(id)sender {
}

- (IBAction)rouletteBotao:(id)sender {
}
@end
