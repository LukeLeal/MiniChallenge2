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
    int count;
    NSMutableArray *selecionados;
    //int hours, minutes, seconds;
    double secondsLeft;
    NSTimer *timer;
}

@end

@implementation MemoriaViewController

@synthesize carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"Memória"];
    
    secondsLeft = 60;
    [self countdownTimer];
    arrayBotoes = [NSArray arrayWithObjects: carta1,carta2,carta3,carta4,carta5,carta6,carta7,carta8,carta9,carta10,carta11,carta12,nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [self preparaCartas];
    count=0;
    selecionados = [[NSMutableArray alloc]init];
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
        botao.layer.borderWidth = 5.0;
        botao.layer.borderColor = [UIColor grayColor].CGColor;
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
              
//                           [sender setTitleColor:[UIColor whiteColor] forState:normal];
                           [sender.titleLabel setAlpha:1.0f];
                       } completion:^(BOOL finished){
                           [sender setUserInteractionEnabled:NO];
                           [self jogo:sender];
                       }];
}

- (void)jogo: (UIButton *)sender{
    if([selecionados count] == 0){
        [selecionados addObject:sender];
    }
    
    else{
        if([self verificaTag:sender]){
            [selecionados addObject:sender];
            if ([selecionados count] == 3){
                [self acerto];
            }
        }
        else{
            [selecionados addObject:sender];
            [self retornaCartas];
        }
    }
}

//- (BOOL)continua{
//    count++;
//    if(count == 3){
//        return false;
//    }
//    else{
//        return true;
//    }
//}

- (BOOL)verificaTag: (UIButton *)botao{
    UIButton *last = [selecionados lastObject];
    if(botao.tag == last.tag){
        return true;
    }
    else{
        return false;
    }
}

- (void)retornaCartas{
    
    for (UIButton *b in selecionados){
        [self animacaoErro:b];
        [b setUserInteractionEnabled:YES];
    }
    
    [selecionados removeAllObjects];
}

- (void)animacaoErro: (UIButton *)botao{
    [botao setBackgroundColor:[UIColor blackColor]];
    [botao.titleLabel setAlpha:0.0f];
    [UIView transitionWithView:botao duration:0.5
                       options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                       } completion:nil];
}

- (void)acerto{
    for (UIButton *b in selecionados){
        [self animacaoAcerto:b];
    }
    [selecionados removeAllObjects];
}

- (void)animacaoAcerto: (UIButton *)botao{
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    botao.transform = CGAffineTransformMakeScale(1.8, 1.8);
    botao.alpha = 1.0f;
    [UIView commitAnimations];
    
    [UIView beginAnimations:@"fadeInNewView" context:NULL];
    [UIView setAnimationDuration:1.0];
    botao.transform = CGAffineTransformMakeScale(1,1);
    botao.alpha = 1.0f;
    botao.layer.borderWidth = 5.0;
    botao.layer.borderColor = [UIColor purpleColor].CGColor;
    [UIView commitAnimations];
}
@end
