//
//  MemoriaManager.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "MemoriaManager.h"

@implementation MemoriaManager

@synthesize arrayDoencas, cartas, pontuacao;

- (instancetype)init{
    self = [super init];
    if(self){
        DoencaManager *doencas = [[DoencaManager alloc]init];
        self.arrayDoencas = [NSMutableArray arrayWithArray:doencas.doencas];
        cartas = [[NSMutableArray alloc]init];
        
        [self sorteio:arrayDoencas];
        [self remove];
        [self criarCartas];
        pontuacao = 0;
    }
    return self;
}

- (void)sorteio:(NSMutableArray *)mArray {
    for (int x = 0; x < [mArray count]; x++) {//Embaralha a ordem das doenças
        int randInt = (arc4random() % ([mArray count] - x)) + x;
        [mArray exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
}

- (void)remove{
    while ([arrayDoencas count] > 4){
        [arrayDoencas removeLastObject];
    }
}

- (void)sortearNovamente{
    [cartas removeAllObjects];
    [self criarCartas];
}

-(void)criarCartas{
    int i = 0;
    
    for(Doenca *doenca in arrayDoencas ){
        
        [cartas addObject:[[Carta alloc]initWithTexto:doenca.nome  andTag:i]];
        [cartas addObject:[[Carta alloc]initWithTexto:doenca.causa  andTag:i]];
        
        NSArray *s = [[doenca sintomas] allObjects];
        [cartas addObject:[[Carta alloc]initWithTexto:[(Sintoma *)[s objectAtIndex:0] texto] andTag:i]];
        
        i++;
    }
    
    [self sorteio:cartas];
}

@end
