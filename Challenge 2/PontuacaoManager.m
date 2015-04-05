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
//        self.pontuacoes = [[NSMutableArray alloc] init];
//        RLMResults *results = [Pontuacao allObjects];
//        for (Pontuacao *pontuacao in results)
//            [self.pontuacoes addObject:pontuacao];
    }
    return self;
}

- (void)addPontuacao:(PontuacaoBeta *)pontuacao {
    //[self.pontuacoes addObject:pontuacao];
    
    [[DataManager sharedInstance] inserePontuacao:pontuacao];
    self.pontuacaoAtual = [[PontuacaoBeta alloc] init];
    
    //    RLMRealm *realm = [RLMRealm defaultRealm];
    //    [realm beginWriteTransaction];
    //    [realm addObject:pontuacao];
    //    [realm commitWriteTransaction];
}

//- (void)removePontuacao:(Pontuacao *)pontuacao {
//    RLMRealm *realm = [RLMRealm defaultRealm];
//    [realm beginWriteTransaction];
//    [realm deleteObject:pontuacao];
//    [realm commitWriteTransaction];
//    
//    [self.pontuacoes removeObject:pontuacao];
//}

- (NSArray *)sortedPontuacoes {
//    return [self.pontuacoes sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//        int first, second;
//        first = [(Pontuacao *)obj1 pontos];
//        second = [(Pontuacao *)obj2 pontos];
//        if (first > second)
//            return NSOrderedAscending;
//        if (second > first)
//            return NSOrderedDescending;
//        return NSOrderedSame;
//    }];
    
    //Pega as pontuações do banco e as ordena em ordem decrescente
    NSMutableArray *sortedPontuacao = [NSMutableArray arrayWithArray: [[DataManager sharedInstance] busca:@"Pontuacao"]];
    [sortedPontuacao sortUsingSelector:@selector(compare:)];
    return sortedPontuacao;
}

@end
