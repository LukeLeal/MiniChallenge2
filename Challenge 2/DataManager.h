//
//  DataManager.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 01/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Doenca.h"
#import "DoencaBeta.h"
#import "Sintoma.h"
#import "Pergunta.h"
#import "PerguntaBeta.h"
#import "Alternativa.h"
#import "Pontuacao.h"
#import "PontuacaoBeta.h"

@interface DataManager : NSObject

@property (nonatomic, strong) NSManagedObjectContext* context;

+(DataManager *) sharedInstance;

-(void) iniciaDados;
-(void) inserePontuacao: (PontuacaoBeta *)p;
-(NSArray *) busca: (NSString *)entidade;
-(NSArray *) busca: (NSString *)entidade withPredicado: (NSString *)predicado;
@end
