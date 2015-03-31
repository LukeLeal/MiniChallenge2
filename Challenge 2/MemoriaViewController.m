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

@synthesize carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Memória"];
    
    arrayBotoes = [NSArray arrayWithObjects: carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12,nil];
    
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
        [botao setBackgroundColor:[UIColor blackColor]];
        [botao setTag:carta.tag];
        
        [botao.titleLabel setAlpha:0.0f];
    }
}

-(UIColor *)corByTag: (int)tag{
    switch (tag) {
        case 0:
            return [UIColor redColor];
            break;
        case 1:
            return [UIColor orangeColor];
            break;
        case 2:
            return [UIColor blueColor];
            break;
        case 3:
            return [UIColor greenColor];
            break;
        default:
            break;
    }
    return nil;
}


- (IBAction)botao:(UIButton *)sender {
//    Setar a cor para não dar um efeito de delay durante a troca de cor
    [sender setBackgroundColor:[self corByTag:(int)sender.tag]];
    [UIView transitionWithView:sender duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
              
                           [sender setTitleColor:[UIColor whiteColor] forState:normal];
                       } completion:nil];
}
@end
