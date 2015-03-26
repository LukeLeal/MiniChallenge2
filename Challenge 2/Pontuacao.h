//
//  Pontuacao.h
//  Challenge 2
//
//  Created by Samuel Shin Kim on 23/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Pontuacao : RLMObject

@property NSString *nome;
@property NSData *foto;
@property int pontos;
@property NSString *categoria;

- (instancetype)initWithNome:(NSString *)newNome andFoto:(UIImage *)newFoto andPontos:(int)newPontos andCategoria:(NSString *)newCategoria;
- (void)setFotoWithUIImage:(UIImage *)newFoto;

@end
