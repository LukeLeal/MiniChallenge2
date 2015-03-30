//
//  MemoriaManager.m
//  Challenge 2
//
//  Created by Andre Lucas Ota on 30/03/15.
//  Copyright (c) 2015 Bepid. All rights reserved.
//

#import "MemoriaManager.h"

@implementation MemoriaManager

@synthesize arrayDoencas;

- (instancetype)init{
    self = [super init];
    if(self){
        DoencaManager *doencas = [[DoencaManager alloc]init];
        self.arrayDoencas = [NSMutableArray arrayWithArray:doencas.doencas];
        
        [self sorteio];
        [self remove];
    }
    return self;
}

- (void)sorteio{
    for (int x = 0; x < [arrayDoencas count]; x++) {//Embaralha a ordem das doenças
        int randInt = (arc4random() % ([arrayDoencas count] - x)) + x;
        [arrayDoencas exchangeObjectAtIndex:x withObjectAtIndex:randInt];
    }
}

- (void)remove{
    while ([arrayDoencas count] > 5){
        [arrayDoencas removeLastObject];
    }
}

@end
