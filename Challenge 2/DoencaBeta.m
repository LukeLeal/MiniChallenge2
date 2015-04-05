//
//  DoencaBeta.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 01/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "DoencaBeta.h"

@implementation DoencaBeta

- (instancetype)initWithNome:(NSString *)newNome andCausa:(NSString *)newCausa andPrevencao:(NSString *)newPrevencao andDescricao:(NSString *)newDescricao andSintomas:(NSArray *)newSintomas andImagem:(NSString *)newImagem {
    self = [super init];
    if (self) {
        self.nome = newNome;
        self.causa = newCausa;
        self.prevencao = newPrevencao;
        self.descricao = newDescricao;
        self.sintomas = newSintomas;
        self.imagem = newImagem;
    }
    return self;
}

@end
