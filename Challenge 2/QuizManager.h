//
//  QuizManager.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 25/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Pergunta.h"

@interface QuizManager : NSObject

@property NSMutableArray *perguntas;
@property int pontuacao;
@property int perguntaAtual;
@property int seqAcertos;// sequencia de acertos


@end
