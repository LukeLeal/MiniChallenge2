//
//  Pontuacao.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Pontuacao.h"

@implementation Pontuacao

- (instancetype)initWithNome:(NSString *)newNome andFoto:(UIImage *)newFoto andPontos:(int)newPontos andCategoria:(NSString *)newCategoria {
    self = [super init];
    if (self) {
        self.nome = newNome;
        self.foto = UIImagePNGRepresentation(newFoto);
        self.pontos = newPontos;
        self.categoria = newCategoria;
    }
    return self;
}

@end
