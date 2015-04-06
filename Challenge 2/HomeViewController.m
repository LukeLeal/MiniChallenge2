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
    
    
    //Verifica se é a primeira execução do App. Se for, insere os dados padrão no banco.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (![ud objectForKey:@"dadosCriados"]) {
        NSLog(@"Primeira vez");
        [[DataManager sharedInstance] iniciaDados];
        [ud setBool:YES forKey:@"dadosCriados"];
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated{
    [self animacao];
}


#pragma mark - Animação

- (void)animacao{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        jogar.transform = CGAffineTransformMakeTranslation(0, -180);
        pontuacao.transform = CGAffineTransformMakeTranslation(0, -180);
        enciclopedia.transform = CGAffineTransformMakeTranslation(0, -180);
        logo.transform = CGAffineTransformMakeTranslation(0, 80);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)animacaoTransicao{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
                     }];
}


#pragma mark - Métodos dos botões

- (IBAction)jogarBotao:(id)sender {
    JogosViewController *jogos = [[JogosViewController alloc]init];
    [self animacaoTransicao];
    [self.navigationController pushViewController:jogos animated:NO];
}

- (IBAction)pontuacaoBotao:(id)sender {
    PontuacaoViewController *ranking = [[PontuacaoViewController alloc]init];
    [self animacaoTransicao];
    [self.navigationController pushViewController:ranking animated:NO];
}

- (IBAction)enciclopediaBotao:(id)sender {
//Ir para tela de enciclopédia
    EnciclopediaViewController *enc =[[EnciclopediaViewController alloc]init];
    [self animacaoTransicao];
    [self.navigationController pushViewController:enc animated:NO];
}

@end
