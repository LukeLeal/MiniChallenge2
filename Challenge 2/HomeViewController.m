//
//  HomeViewController.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize jogar, pontuacao, enciclopedia, logo;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Home"];
    [logo setImage: [UIImage imageWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"img.jpg" ofType:nil]]];
}

- (void)viewDidAppear:(BOOL)animated{
    [self animacao];
}


#pragma mark - Animação

- (void)animacao{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
        jogar.transform = CGAffineTransformMakeTranslation(0, -100);
        pontuacao.transform = CGAffineTransformMakeTranslation(0, -100);
        enciclopedia.transform = CGAffineTransformMakeTranslation(0, -100);
        logo.transform = CGAffineTransformMakeTranslation(0, 100);
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - Métodos dos botões

- (IBAction)jogarBotao:(id)sender {
//    Ir para tela de escolha de jogos
}

- (IBAction)pontuacaoBotao:(id)sender {
    PontuacaoViewController *ranking = [[PontuacaoViewController alloc]init];
    
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
    
    [self.navigationController pushViewController:ranking animated:NO];
}

- (IBAction)enciclopediaBotao:(id)sender {
//    Ir para tela de enciclopédia
}

@end
