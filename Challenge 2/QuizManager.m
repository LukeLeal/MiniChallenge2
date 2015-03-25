//
//  QuizManager.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "QuizManager.h"

@implementation QuizManager

-(id) init{
    self = [super init];
    if (self) {
        _perguntas = [[NSMutableArray alloc] initWithObjects:
                      [[Pergunta alloc] init:@"P 1" withAlternativas:@[@"Certo", @"bvadvas", @"casfafw"]],
                      [[Pergunta alloc] init:@"P 2" withAlternativas:@[@"6", @"7", @"8"]],
                      //[[Pergunta alloc] init:<#(NSString *)#> withCorreto:<#(NSString *)#> withAlternativas:<#(NSArray *)#>]
                      nil];
        
        for (Pergunta *p in _perguntas) {//Embaralha a ordem das alternativas de cada pergunta
            for (int x = 0; x < [[p alternativas] count]; x++) {
                int randInt = (arc4random() % ([[p alternativas] count] - x)) + x;
                [[p alternativas] exchangeObjectAtIndex:x withObjectAtIndex:randInt];
                //[(UIButton *)[botoes objectAtIndex:x] setTag:0];
            }
        }
        
        for (int x = 0; x < [_perguntas count]; x++) {//Embaralha a ordem das perguntas
            int randInt = (arc4random() % ([_perguntas count] - x)) + x;
            [_perguntas exchangeObjectAtIndex:x withObjectAtIndex:randInt];
            //[(UIButton *)[botoes objectAtIndex:x] setTag:0];
        }
        _pontuacao = 0;
        _perguntaAtual = 0;
    }
    
    return self;
    
}

@end
