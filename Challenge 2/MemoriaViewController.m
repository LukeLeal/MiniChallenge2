//
//  MemoriaViewController.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "MemoriaViewController.h"

@interface MemoriaViewController (){
    NSArray *arrayBotoes;
}

@end

@implementation MemoriaViewController

@synthesize carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12,carta13,carta14,carta15;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Memória"];
    
    arrayBotoes = [NSArray arrayWithObjects: carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12,carta13,carta14,carta15,nil];
    
    [self preparaCartas];
}

- (void)viewWillDisappear:(BOOL)animated{
    [UIView animateWithDuration:0.75
                     animations:^{
                         [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
                         [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.navigationController.view cache:NO];
                     }];
}

-(void)preparaCartas{
    MemoriaManager *memoriaManager = [[MemoriaManager alloc]init];
    NSArray *cartas = [NSArray arrayWithArray:memoriaManager.cartas];
    
    NSLog(@"%lu",[cartas count]);
    Carta *carta;
    UIButton *botao;
    
    for (int i=0; i<[arrayBotoes count]; i++) {
        carta = [cartas objectAtIndex:i];
        botao = [arrayBotoes objectAtIndex:i];
        
        [botao setTitle:carta.texto forState:normal];
        [botao setBackgroundColor:carta.cor];
        [botao setTag:carta.tag];
        
        [botao.titleLabel setAlpha:0.0f];
    }
}

- (IBAction)botao:(UIButton *)sender {
//    Setar a cor para não dar um efeito de delay durante a troca de cor
    [sender setBackgroundColor:[UIColor blueColor]];
    [UIView transitionWithView:sender duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
                           [sender setBackgroundColor:[UIColor blueColor]];
                           [sender setTitleColor:[UIColor whiteColor] forState:normal];
                       } completion:nil];
}
@end
