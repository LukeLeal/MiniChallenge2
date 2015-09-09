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

-(NSComparisonResult)localizedCaseInsensitiveCompare:(Doenca *)outro{
    return [self.nome localizedCaseInsensitiveCompare:[outro nome]];
}


@end
