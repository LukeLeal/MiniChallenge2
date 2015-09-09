//
//  MemoriaManager.h
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DoencaManager.h"
#import "Doenca.h"
#import "Carta.h"

@interface MemoriaManager : NSObject

@property NSMutableArray *arrayDoencas;
@property NSMutableArray *cartas;
@property int pontuacao;

- (instancetype)init;
- (void)sortearNovamente;
@end
