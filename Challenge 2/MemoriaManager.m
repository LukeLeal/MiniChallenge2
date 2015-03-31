//
//  MemoriaManager.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "MemoriaManager.h"

@implementation MemoriaManager

@synthesize arrayDoencas, cartas;

- (instancetype)init{
    self = [super init];
    if(self){
        DoencaManager *doencas = [[DoencaManager alloc]init];
        self.arrayDoencas = [NSMutableArray arrayWithArray:doencas.doencas];
        
        [self sorteio:arrayDoencas];
        [self remove];
        [self criarCartas];
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

-(void)criarCartas{
    int i = 0;
    
    cartas = [[NSMutableArray alloc]init];
    
    for(Doenca *doenca in arrayDoencas ){
        
        [cartas addObject:[[Carta alloc]initWithTexto:doenca.nome  andTag:i]];
        [cartas addObject:[[Carta alloc]initWithTexto:doenca.causa  andTag:i]];
        [cartas addObject:[[Carta alloc]initWithTexto:[doenca.sintomas objectAtIndex:0] andTag:i]];
        
        i++;
    }
    
    [self sorteio:cartas];
}

@end
