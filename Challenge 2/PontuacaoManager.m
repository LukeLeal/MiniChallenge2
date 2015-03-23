//
//  PontuacaoManager.m
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "PontuacaoManager.h"

@implementation PontuacaoManager

static PontuacaoManager *singleton = nil;
static bool isFirstAccess = YES;

#pragma mark - Pontuação

+ (id)sharedInstance{
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
        self.pontuacoes = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
