//
//  PontuacaoManager.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pontuacao.h"

@interface PontuacaoManager : NSObject

@property NSMutableArray *pontuacoes;
@property Pontuacao *pontuacaoAtual;

+ (PontuacaoManager *)sharedInstance;
- (void)addPontuacao:(Pontuacao *)pontuacao;
- (NSArray *)sortedPontuacoes;

@end
