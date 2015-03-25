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
    
    UIImage *img = [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"Home.png" ofType:nil]];
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:img style:UIBarButtonItemStylePlain target: self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
}

- (IBAction)memoriaBotao:(id)sender {
}

- (IBAction)quizBotao:(id)sender {
}

- (IBAction)rouletteBotao:(id)sender {
}

- (void) back:(id)sender{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
    [self.navigationController popViewControllerAnimated:NO];
}
@end
