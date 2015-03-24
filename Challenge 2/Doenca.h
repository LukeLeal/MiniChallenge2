//
//  Doenca.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 24/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Doenca : NSObject

@property NSString *nome;
@property NSString *causa;
@property NSString *prevencao;
@property NSString *descricao;
@property NSArray *sintomas;
@property NSArray *imagens;

- (instancetype)initWithNome:(NSString *)newNome andCausa:(NSString *)newCausa andPrevencao:(NSString *)newPrevencao andDescricao:(NSString *)newDescricao andSintomas:(NSArray *)newSintomas andImagens:(NSArray *)newImagens;

@end
