//
//  PontuacaoManager.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "PontuacaoManager.h"

@implementation PontuacaoManager

static PontuacaoManager *singleton;
static bool isFirstAccess = YES;

#pragma mark - Pontuação

+ (id)sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;
        singleton = [[super allocWithZone:NULL] init];
    });
    return singleton;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.pontuacaoAtual = [[PontuacaoBeta alloc] init];
    }
    return self;
}

- (void)addPontuacao:(PontuacaoBeta *)pontuacao {
    [[DataManager sharedInstance] inserePontuacao:pontuacao];
    self.pontuacaoAtual = [[PontuacaoBeta alloc] init];
}

- (void)removePontuacao:(Pontuacao *)pontuacao {
    
    [[DataManager sharedInstance] deleta:@"Pontuacao" withPredicado:[pontuacao cod]];
}

- (NSArray *)sortedPontuacoes {
    //Pega as pontuações do banco e as ordena em ordem decrescente
    NSMutableArray *sortedPontuacao = [NSMutableArray arrayWithArray: [[DataManager sharedInstance] busca:@"Pontuacao"]];
    [sortedPontuacao sortUsingSelector:@selector(compare:)];
    return sortedPontuacao;
}

@end
