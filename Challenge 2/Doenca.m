//
//  Doenca.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "Doenca.h"


@implementation Doenca

@dynamic nome;
@dynamic prevencao;
@dynamic causa;
@dynamic imagem;
@dynamic descricao;
@dynamic sintomas;

//- (instancetype)initWithNome:(NSString *)newNome andCausa:(NSString *)newCausa andPrevencao:(NSString *)newPrevencao andDescricao:(NSString *)newDescricao andSintomas:(NSArray *)newSintomas andImagem:(NSString *)newImagem {
//    self = [super init];
//    if (self) {
//        self.nome = newNome;
//        self.causa = newCausa;
//        self.prevencao = newPrevencao;
//        self.descricao = newDescricao;
//        self.sintomas = [NSSet setWithArray: newSintomas];
//        self.imagem = newImagem;
//    }
//    return self;
//}

//-(NSArray *) getSintomasArray{
//    NSArray *doencas = [[DataManager sharedInstance] busca:@"Doenca" withPredicado:self.nome];
//    NSArray *s = [[doencas objectAtIndex:0] sint] ;
//    for (Doenca *d in doencas) {
//        NSManagedObject sintoma
//    }
//    return s;
//}

-(NSComparisonResult)localizedCaseInsensitiveCompare:(Doenca *)outro{
    return [self.nome localizedCaseInsensitiveCompare:[outro nome]];
}


@end
