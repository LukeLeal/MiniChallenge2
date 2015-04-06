//
//  PontuacaoManager.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pontuacao.h"
#import "PontuacaoBeta.h"
#import "DataManager.h"

@interface PontuacaoManager : NSObject

@property NSMutableArray *pontuacoes;
@property PontuacaoBeta *pontuacaoAtual;

+ (PontuacaoManager *)sharedInstance;
- (void)addPontuacao:(PontuacaoBeta *)pontuacao;
- (void)removePontuacao:(Pontuacao *)pontuacao;
- (NSArray *)sortedPontuacoes;

@end
