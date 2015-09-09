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
        _seqAcertos = 1;
        _perguntas = [NSMutableArray arrayWithArray:[[DataManager sharedInstance] busca:@"Pergunta"]];
        for (int x = 0; x < [_perguntas count]; x++) {//Embaralha a ordem das perguntas
            int randInt = (arc4random() % ([_perguntas count] - x)) + x;
            [_perguntas exchangeObjectAtIndex:x withObjectAtIndex:randInt];
        }
        _pontuacao = 0;
        _perguntaAtual = 0;
    }
    
    return self;
    
}

-(NSMutableArray *) embaralha{
    NSMutableArray *a = [NSMutableArray arrayWithArray:[[[_perguntas objectAtIndex:_perguntaAtual] alternativas] allObjects]];
    for (int x = 0; x < [a count]; x++) {
        int randInt = (arc4random() % ([a count] - x)) + x;
        [a exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
    return a;
}

@end
