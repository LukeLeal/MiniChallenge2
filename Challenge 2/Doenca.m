//
//  Doenca.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Doenca.h"

@implementation Doenca

- (instancetype)initWithNome:(NSString *)newNome andCausa:(NSString *)newCausa andPrevencao:(NSString *)newPrevencao andDescricao:(NSString *)newDescricao andSintomas:(NSArray *)newSintomas andImagens:(NSArray *)newImagens {
    self = [super init];
    if (self) {
        self.nome = newNome;
        self.causa = newCausa;
        self.prevencao = newPrevencao;
        self.descricao = newDescricao;
        self.sintomas = newSintomas;
        self.imagens = newImagens;
    }
    return self;
}

@end
