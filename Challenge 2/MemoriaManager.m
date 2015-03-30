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
    while ([arrayDoencas count] > 5){
        [arrayDoencas removeLastObject];
    }
}

-(void)criarCartas{
//    NSArray *cores = @[[UIColor redColor], [UIColor yellowColor], [UIColor blueColor], [UIColor greenColor], [UIColor orangeColor]];
    NSArray *cores = [[NSArray alloc]initWithObjects:[UIColor redColor],[UIColor yellowColor],[UIColor blueColor],[UIColor greenColor],[UIColor orangeColor], nil];
    int i = 0;
    NSInteger *etiqueta = 0;
    
    for(Doenca *doenca in arrayDoencas ){
        
        [cartas addObject:[[Carta alloc]initWithTexto:doenca.nome andCor:[cores objectAtIndex:i] andTag:etiqueta]];
        [cartas addObject:[[Carta alloc]initWithTexto:doenca.causa andCor:[cores objectAtIndex:i] andTag:etiqueta]];
        [cartas addObject:[[Carta alloc]initWithTexto:[doenca.sintomas objectAtIndex:0] andCor:[cores objectAtIndex:i] andTag:etiqueta]];
        
        i++;etiqueta++;
    }
    
    [self sorteio:cartas];
}

@end
