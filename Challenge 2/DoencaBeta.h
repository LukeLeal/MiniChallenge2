//
//  DoencaBeta.h
//  Challenge 2
//
//  Created by Lucas Leal Mendonça on 01/04/15.
//  Copyright (c) 2015 BEPiD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DoencaBeta : NSObject

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *prevencao;
@property (nonatomic, retain) NSString *causa;
@property (nonatomic, retain) NSString *imagem;
@property (nonatomic, retain) NSString *descricao;
@property (nonatomic, retain) NSArray *sintomas;

- (instancetype)initWithNome:(NSString *)newNome andCausa:(NSString *)newCausa andPrevencao:(NSString *)newPrevencao andDescricao:(NSString *)newDescricao andSintomas:(NSArray *)newSintomas andImagem:(NSString *)newImagem;

@end
