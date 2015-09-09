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

@synthesize jogar, pontuacao, enciclopedia, logo, deviceModel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    deviceModel = [DeviceModel instance];
    //Verifica se é a primeira execução do App. Se for, insere os dados padrão no banco.
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    if (![ud objectForKey:@"dadosCriados"]) {
        [[DataManager sharedInstance] iniciaDados];
        [ud setBool:YES forKey:@"dadosCriados"];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidAppear:(BOOL)animated{
//    [self animacao];
    [self adjustFont];
    [self prepareAnimation];
//    [self.view sizeToFit];
    
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    NSLog(@"%f",window.frame.size.height);
}

- (void)adjustFont{
    jogar.titleLabel.adjustsFontSizeToFitWidth = YES;
    pontuacao.titleLabel.adjustsFontSizeToFitWidth = YES;
    enciclopedia.titleLabel.adjustsFontSizeToFitWidth = YES;
}

#pragma mark - Animação
- (void)prepareAnimation{
//    float ammount1 = [deviceModel getHomeViewAnimationLabelAmmount];
//    float ammount2 = [deviceModel getHomeViewAnimationLogoAmmount];
    
    float ammount1 = -(self.view.frame.size.height / 5);
    float ammount2 = (self.view.frame.size.height / 10);
    
    
    [self animacao:ammount1 :ammount2];
}

- (void)animacao: (float)ammount1 : (float)ammount2{
    [UIView animateWithDuration:1 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        jogar.transform = CGAffineTransformMakeTranslation(0, ammount1);
        pontuacao.transform = CGAffineTransformMakeTranslation(0, ammount1);
        enciclopedia.transform = CGAffineTransformMakeTranslation(0, ammount1);
        logo.transform = CGAffineTransformMakeTranslation(0, ammount2);
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
