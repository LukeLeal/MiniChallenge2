//
//  Pontuacao.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Pontuacao.h"

@implementation Pontuacao

@dynamic foto;
@dynamic nome;
@dynamic pontos;
@dynamic categoria;
@dynamic cod;

- (void)setFotoWithUIImage:(UIImage *)newFoto {
    self.foto = UIImagePNGRepresentation(newFoto);
}

- (UIImage *)getFotoAsImage {
    return [UIImage imageWithData:self.foto];
}

-(NSComparisonResult) compare: (Pontuacao *)outro{
    //Ordena em ordem decrescente
    return [[outro pontos] compare:self.pontos];
}

@end
