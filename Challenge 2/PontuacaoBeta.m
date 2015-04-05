//
//  PotuacaoBeta.m
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 02/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import "PontuacaoBeta.h"

@implementation PontuacaoBeta

//- (instancetype)initWithNome:(NSString *)newNome andFoto:(UIImage *)newFoto andPontos:(int)newPontos andCategoria:(NSString *)newCategoria {
//    self = [super init];
//    if (self) {
//        self.nome = newNome;
//        self.foto = UIImagePNGRepresentation(newFoto);
//        self.pontos = [NSNumber numberWithInt:newPontos];//Core Data guarda NSNumber.
//        self.categoria = newCategoria;
//    }
//    return self;
//}

- (void)setFotoWithUIImage:(UIImage *)newFoto {
    self.foto = UIImagePNGRepresentation(newFoto);
}

- (UIImage *)getFotoAsImage {
    return [UIImage imageWithData:self.foto];
}

@end
