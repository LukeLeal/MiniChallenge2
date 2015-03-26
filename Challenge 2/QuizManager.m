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
                      [[Pergunta alloc] init:@"Quais destes são sintomas da pneumonia?" withAlternativas:@[@"Falta de ar e bolhas avermelhadas na pele", @"Ardência nos olhos e rigidez na nuca", @"Febre alta e dor no tórax"]],
                      [[Pergunta alloc] init:@"Como a aids ataca o corpo humano?" withAlternativas:@[@"Atacando o sistema imunológico e destruindo os glóbulos brancos", @"Inflamando as meninges, membranas que recobrem o cérebro", @"Infeccionando a cavidade abdominal"]],
                      [[Pergunta alloc] init:@"Qual destas é uma medida contra a meningite?" withAlternativas:@[@"Vacina", @"Remoção da apêndice", @"Limpar frequentemente as mãos"]],
                      [[Pergunta alloc] init:@"Qual destas doenças pode infectar alguém por uma lesão na pele?" withAlternativas:@[@"Tétano", @"Alzheimer", @"Apendicite"]],
                      //[[Pergunta alloc] init:@"" withAlternativas:@[@"", @"", @""]]
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
