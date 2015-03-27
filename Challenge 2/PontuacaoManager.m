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
        self.pontuacaoAtual = [[Pontuacao alloc] init];
        self.pontuacoes = [[NSMutableArray alloc] init];
        RLMResults *results = [Pontuacao allObjects];
        for (Pontuacao *pontuacao in results)
            [self.pontuacoes addObject:pontuacao];
    }
    return self;
}

- (void)addPontuacao:(Pontuacao *)pontuacao {
    [self.pontuacoes addObject:pontuacao];
    self.pontuacaoAtual = [[Pontuacao alloc] init];
    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:pontuacao];
    [realm commitWriteTransaction];
}

- (NSArray *)sortedPontuacoes {
    return [self.pontuacoes sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        int first, second;
        first = [(Pontuacao *)obj1 pontos];
        second = [(Pontuacao *)obj2 pontos];
        if (first > second)
            return NSOrderedAscending;
        if (second > first)
            return NSOrderedDescending;
        return NSOrderedSame;
    }];
}

@end
