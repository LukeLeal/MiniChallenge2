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
#warning Implementar recuperação de dados pelo Realm.io
        self.pontuacoesQuiz = [[NSMutableArray alloc] initWithObjects:[[Pontuacao alloc] initWithNome:@"Samuel" andFoto:nil andPontos:10000],
                           [[Pontuacao alloc] initWithNome:@"Leal" andFoto:nil andPontos:0],
                           [[Pontuacao alloc] initWithNome:@"André" andFoto:nil andPontos:0],
                           [[Pontuacao alloc] initWithNome:@"Amanda" andFoto:nil andPontos:0], nil];
        self.pontuacoesMemoria = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
