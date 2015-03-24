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
}

- (void)viewWillAppear:(BOOL)animated{
    jogar.transform = CGAffineTransformMakeTranslation(0, 180);
    pontuacao.transform = CGAffineTransformMakeTranslation(0, 180);
    enciclopedia.transform = CGAffineTransformMakeTranslation(0, 180);
    logo.transform = CGAffineTransformMakeTranslation(0, -180);
}

- (void)viewDidAppear:(BOOL)animated{
    [self animacao];
}


#pragma mark - Animação

- (void)animacao{
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationCurveEaseIn animations:^{
        jogar.transform = CGAffineTransformMakeTranslation(0, -180);
        pontuacao.transform = CGAffineTransformMakeTranslation(0, -180);
        enciclopedia.transform = CGAffineTransformMakeTranslation(0, -180);
        logo.transform = CGAffineTransformMakeTranslation(0, 180);
    } completion:^(BOOL finished) {
        
    }];
}


#pragma mark - Métodos dos botões

- (IBAction)jogarBotao:(id)sender {
//    Ir para tela de escolha de jogos
}

- (IBAction)pontuacaoBotao:(id)sender {
//    Ir para tela de pontuação
}

- (IBAction)enciclopediaBotao:(id)sender {
//    Ir para tela de enciclopédia
}

@end
